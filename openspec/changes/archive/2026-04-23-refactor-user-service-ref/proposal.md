## Why

O método `createUser` em `UserService` monta a referência do Realtime Database inline como string `'user/${user.id}'`. Extrair a referência base `user` como getter privado centraliza o caminho da tabela e torna todos os métodos de CRUD mais legíveis e fáceis de manter.

## What Changes

- Extrair getter privado `_ref` que retorna `DatabaseFirebase.instance.ref('user')` em `UserService`
- Refatorar `createUser` para usar `_ref`
- Refatorar os demais métodos CRUD (`getUser`, `updateUser`, `deleteUser`, `getUserByEmail`) para usar `_ref` como base

## Capabilities

### New Capabilities
(nenhuma)

### Modified Capabilities
- `user-service`: métodos CRUD passam a usar referência base `_ref` em vez de strings inline

## Impact

- `lib/services/user_service.dart` — refatoração interna; nenhuma API pública alterada
