## Why

`createUser` em `UserService` grava o usuário sem verificar se o `user.id` (UDID do device) já existe no banco. Isso permite que o mesmo dispositivo seja cadastrado múltiplas vezes, corrompendo dados e causando conflitos.

## What Changes

- `createUser` em `UserService` passa a consultar `_ref.child(user.id)` antes de gravar
- Se o snapshot já existir, lança uma exceção com a mensagem `"Device informado já foi cadastrado"`
- Nenhuma alteração na assinatura pública do método (`Future<void>`)

## Capabilities

### New Capabilities
(nenhuma)

### Modified Capabilities
- `user-service`: `createUser` passa a rejeitar cadastros duplicados por `user.id`

## Impact

- `lib/services/user_service.dart` — lógica interna de `createUser`
- Camadas que chamam `createUser` (ViewModel / flow de criar conta) precisam tratar o novo erro
