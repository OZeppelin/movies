## Context

A `EsqueciSenhaScreen` é uma `StatefulWidget` que já possui o `TextEditingController` para o campo de email, mas o botão "Enviar link de recuperação" tem `onPressed: () {}` — sem validação e sem chamada Firebase. O projeto já segue MVVM com `BaseViewModel` + `provider`, conforme implementado no `LoginViewModel`. A refatoração deve ser consistente com esse padrão.

## Goals / Non-Goals

**Goals:**
- Criar `EsqueciSenhaViewModel` estendendo `BaseViewModel` com validação de email e `sendPasswordResetEmail`
- Mover toda lógica de validação e Firebase para o ViewModel
- Refatorar `EsqueciSenhaScreen` para View pura: `ChangeNotifierProvider` + `Consumer`
- Exibir SnackBar de erro para `errorMessage` e SnackBar de sucesso após envio

**Non-Goals:**
- Alterações no layout ou no design visual da tela
- Verificação se o email existe na base antes do envio (Firebase omite esta informação por segurança)
- Navegação automática após envio (usuário decide via "Lembrei minha senha — Entrar")

## Decisions

### ViewModel estende BaseViewModel
Reutilizar `BaseViewModel` (já fornece `isLoading`, `setLoading`, `notifyListeners`) mantém consistência com `LoginViewModel` e evita código duplicado.

### Validação no ViewModel, não na View
Validação de campo vazio e formato de email via `RegExp` reside no ViewModel (`validateEmail`), retornando `false` e setando `errorMessage`. A View apenas reage ao estado exposto.

**Alternativa considerada:** `Form` + `FormField` validator do Flutter — rejeitada porque acoplaria lógica de validação à View, quebrando MVVM.

### Regex de validação de email
Usar `RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')` — simples, cobre os casos comuns, sem dependência externa.

### Sucesso por SnackBar + pop
Após envio bem-sucedido, exibir SnackBar "Link enviado! Verifique seu email." e chamar `Navigator.pop`. Isso evita estado de "tela de confirmação" sem necessidade de nova tela.

**Alternativa considerada:** Permanecer na tela com mensagem inline — rejeitada por inconsistência com o fluxo de `LoginViewModel` que usa pop após sucesso.

### Firebase: não distinguir email inexistente
`sendPasswordResetEmail` lança `FirebaseAuthException` com `user-not-found`. O ViewModel captura e seta `errorMessage` com a mensagem do erro. Não há tratamento especial por segurança.

## Risks / Trade-offs

- **[Risco] Firebase pode lançar `user-not-found`** → Tratar como erro genérico, exibir mensagem via `errorMessage`. Não revelar se o email existe na base.
- **[Trade-off] Pop imediato após sucesso** → Usuário pode não ter lido o SnackBar antes de a tela fechar. Mitigação: duração do SnackBar de 3 segundos antes do pop.
