## Context

`UserService.createUser` grava diretamente em `_ref.child(user.id).set(...)` sem verificar existência prévia. O `user.id` é o UDID do device (obtido via `getDeviceId()`), portanto é único por dispositivo. O padrão de leitura antes de escrita já existe no método `getUser`, que usa `_ref.child(id).get()`.

## Goals / Non-Goals

**Goals:**
- `createUser` verifica se `_ref.child(user.id)` já existe antes de gravar
- Lança `Exception` com mensagem `"Device informado já foi cadastrado"` em caso de duplicata
- Assinatura pública `Future<void> createUser(UserModel user)` permanece inalterada

**Non-Goals:**
- Alterar outros métodos CRUD
- Alterar `getDeviceId`
- Implementar lógica de deduplicação nas camadas superiores (ViewModel trata a exceção)
- Usar transações Firebase (fora de escopo)

## Decisions

**Lançar `Exception` em vez de retornar tipo de resultado**
`createUser` é `Future<void>` — lançar exceção é o mecanismo idiomático para sinalizar falha em métodos void no Dart. Evita quebrar a assinatura pública e mantém consistência com o restante do serviço.

**Usar `Exception` simples em vez de classe customizada**
Não há necessidade de diferenciar este erro de outros por tipo em runtime neste momento. Uma `Exception` com mensagem descritiva é suficiente para o ViewModel exibir o feedback ao usuário.

**Checar com `_ref.child(user.id).get()` (mesma abordagem de `getUser`)**
Reutiliza o padrão já estabelecido no serviço. A checagem ocorre imediatamente antes do `set`, minimizando a janela de inconsistência.

## Risks / Trade-offs

**Race condition** → Duas chamadas simultâneas poderiam passar na verificação antes de qualquer uma gravar. Mitigação: para o caso de uso atual (cadastro de um único dispositivo), a probabilidade é negligenciável; Firebase Transactions resolveriam isso se necessário no futuro.
