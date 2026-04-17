# user-service

## Purpose

Defines `UserService`, the data-layer service responsible for CRUD operations on the `user` node of the Firebase Realtime Database, and for retrieving the current device UDID via `device_info_plus`.

## Requirements

### Requirement: UserService encapsula CRUD de usuário no Firebase Realtime Database
`UserService` em `lib/services/user_service.dart` SHALL usar `DatabaseFirebase.instance` com referência `user/{id}` para operações CRUD. Todos os métodos SHALL ser assíncronos. A classe SHALL conter apenas chamadas raw ao SDK — sem lógica de negócio ou mapeamento de camadas superiores.

#### Scenario: Criar usuário
- **WHEN** `createUser(UserModel user)` é chamado
- **THEN** SHALL escrever os dados de `user.toMap()` em `user/{user.id}` via `DatabaseReference.set`
- **THEN** SHALL completar sem lançar exceção em caso de sucesso

#### Scenario: Ler usuário por id
- **WHEN** `getUser(String id)` é chamado com um id existente
- **THEN** SHALL ler o snapshot em `user/{id}` via `DatabaseReference.get`
- **THEN** SHALL retornar `UserModel` desserializado do snapshot
- **WHEN** `getUser(String id)` é chamado com um id inexistente
- **THEN** SHALL retornar `null`

#### Scenario: Atualizar usuário
- **WHEN** `updateUser(UserModel user)` é chamado
- **THEN** SHALL atualizar os campos em `user/{user.id}` via `DatabaseReference.update`
- **THEN** SHALL completar sem lançar exceção em caso de sucesso

#### Scenario: Deletar usuário
- **WHEN** `deleteUser(String id)` é chamado
- **THEN** SHALL remover o nó `user/{id}` via `DatabaseReference.remove`
- **THEN** SHALL completar sem lançar exceção em caso de sucesso

### Requirement: UserService obtém o UDID do device atual
`UserService` SHALL expor `Future<String> getDeviceId()` que retorna o UDID do device via `device_info_plus`, abstraindo a diferença entre iOS e Android.

#### Scenario: Obter UDID no iOS
- **WHEN** `getDeviceId()` é chamado em um device iOS
- **THEN** SHALL retornar `IosDeviceInfo.identifierForVendor` como `String`

#### Scenario: Obter UDID no Android
- **WHEN** `getDeviceId()` é chamado em um device Android
- **THEN** SHALL retornar `AndroidDeviceInfo.id` como `String`
