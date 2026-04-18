## Context

O projeto usa MVVM com `provider` + `ChangeNotifier`. `BaseViewModel` fornece `isLoading`/`setLoading`/`notifyListeners`. O fluxo de criação de conta abrange 3 telas navegadas via `Navigator.push` em sequência. O `UserViewModel` precisa ser **compartilhado entre as 3 telas** para acumular dados em memória e evitar passar todos os campos como parâmetros de construtor a cada tela.

`UserService` (em `lib/services/`) já existe com CRUD completo e `getDeviceId()`. `UserModel` tem campos `id`, `name`, `numberPhone`, `email`, `password`, `createdAt`.

## Goals / Non-Goals

**Goals:**
- `UserViewModel` acumula `name`, `numberPhone`, `email`, `password` em memória entre as Steps
- Validações por step: `validateStep1` (nome, telefone) e `validateStep2` (email, senha, confirmação)
- `createUser()`: obtém UDID via `UserService.getDeviceId()`, monta `UserModel` com `createdAt = DateTime.now().toIso8601String()`, chama `UserService.createUser()` + `FirebaseAuth.createUserWithEmailAndPassword`
- Screens refatoradas para Views puras: sem lógica de validação ou Firebase diretamente

**Non-Goals:**
- Upload de foto de perfil (Step3 tem "Alterar foto (opcional)" — fora do escopo)
- Cache persistente entre sessões do app — apenas memória em runtime

## Decisions

### ViewModel compartilhado via construtor explícito
Step1 cria o `ChangeNotifierProvider<UserViewModel>` e passa a instância para Step2/Step3 via construtor. Isso é necessário porque as telas são empurradas via `Navigator.push`, que cria uma nova sub-árvore fora do Provider original.

**Alternativa considerada:** Usar `MultiProvider` no nível do `MaterialApp` — rejeitada pois `UserViewModel` é específico do fluxo de criação de conta e não deve ser global.

**Alternativa considerada:** `InheritedWidget` customizado — rejeitada por complexidade desnecessária dado o padrão já estabelecido no projeto.

### `validateStep1`: nome não vazio + telefone mínimo 10 dígitos
Nome: não pode ser vazio nem apenas espaços. Telefone: extrai apenas dígitos e verifica mínimo de 10 (DDD + número). Formato não é validado além disso para acomodar formatos internacionais.

### `validateStep2`: email com regex, senha mínimo 6 chars, confirmação igual
Email: mesmo regex de `EsqueciSenhaViewModel` (`r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$'`). Senha: mínimo 6 caracteres (exigência mínima do Firebase Auth). Confirmação: comparação de strings simples.

### `createUser()` orquestra UserService + FirebaseAuth
O ViewModel chama ambos: `UserService.createUser(model)` persiste no Realtime Database, `FirebaseAuth.createUserWithEmailAndPassword` cria a conta de autenticação. Se FirebaseAuth falhar, o erro é capturado e exposto via `errorMessage`. A ordem: Firebase Auth primeiro (pode ser rejeitado por email duplicado), depois UserService.

**Alternativa considerada:** Criar no Realtime Database primeiro — rejeitada pois se Firebase Auth falhar, ficaria um registro órfão no banco.

### `saveStep1` e `saveStep2` como setters simples
Gravar os dados em campos privados do ViewModel quando o usuário avança o step. Sem `notifyListeners` — não há UI que reaja a esses dados até o Step3.

## Risks / Trade-offs

- **[Risco] ViewModel descartado se o usuário sair do fluxo pelo back** → Comportamento correto: dados em memória são descartados junto com o Provider quando Step1 é removido da árvore.
- **[Trade-off] Firebase Auth antes de UserService** → Se UserService falhar após Auth ter sido criado, o usuário existe no Auth mas não no Realtime Database. Mitigação: logar o erro; a conta Auth ainda é válida e o registro pode ser criado posteriormente.
- **[Risco] `identifierForVendor` null no iOS** → `getDeviceId()` em `UserService` já retorna `''` como fallback; o ViewModel usa `DateTime.now().millisecondsSinceEpoch.toString()` se o id for vazio.
