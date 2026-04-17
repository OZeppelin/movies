## Why

O projeto não possui camada de serviços para persistência de dados de usuário. Criar `UserService` em `lib/services/` centraliza as operações CRUD sobre a referência `user` no Firebase Realtime Database, usando `DatabaseFirebase` como ponto de acesso ao banco. O `id` de cada registro será o UDID do device, obtido via `device_info_plus`, garantindo unicidade sem autenticação explícita.

## What Changes

- Adicionar `device_info_plus` ao `pubspec.yaml`
- Criar `lib/models/user_model.dart` com `UserModel` (campos: `id`, `name`, `email`, `numberPhone`, `password`, `createdAt`)
- Criar `lib/services/user_service.dart` com `UserService` encapsulando CRUD completo na referência `user/{udid}` do Firebase Realtime Database
- `UserService` expõe: `getDeviceId()`, `createUser()`, `getUser(String id)`, `updateUser(UserModel user)`, `deleteUser(String id)`

## Capabilities

### New Capabilities
- `user-service`: Serviço de persistência de dados de usuário no Firebase Realtime Database com CRUD e id baseado em UDID do device
- `user-model`: Modelo de dados `UserModel` para representar um usuário na camada de serviços

### Modified Capabilities

## Impact

- Novos arquivos: `lib/models/user_model.dart`, `lib/services/user_service.dart`
- Nova dependência: `device_info_plus` (obtenção de UDID — `identifierForVendor` no iOS, `id` no Android)
- Depende de: `DatabaseFirebase` (`lib/core/database_firebase.dart`), `firebase_database` (já presente)
- Sem breaking changes no código existente
