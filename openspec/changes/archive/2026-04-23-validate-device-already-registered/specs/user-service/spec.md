## MODIFIED Requirements

### Requirement: UserService encapsula CRUD de usuário no Firebase Realtime Database
`UserService` em `lib/services/user_service.dart` SHALL usar `DatabaseFirebase.instance` com referência `user/{id}` para operações CRUD. Todos os métodos SHALL ser assíncronos. A classe SHALL conter apenas chamadas raw ao SDK — sem lógica de negócio ou mapeamento de camadas superiores.

#### Scenario: Criar usuário com sucesso
- **WHEN** `createUser(UserModel user)` é chamado e `user.id` não existe em `user/{user.id}`
- **THEN** SHALL escrever os dados de `user.toMap()` em `user/{user.id}` via `DatabaseReference.set`
- **THEN** SHALL completar sem lançar exceção

#### Scenario: Criar usuário com device duplicado
- **WHEN** `createUser(UserModel user)` é chamado e `user.id` já existe em `user/{user.id}`
- **THEN** SHALL lançar `Exception` com mensagem `"Device informado já foi cadastrado"`
- **THEN** SHALL não sobrescrever os dados existentes no banco

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
