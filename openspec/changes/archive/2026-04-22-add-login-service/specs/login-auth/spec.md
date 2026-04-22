## ADDED Requirements

### Requirement: UserService busca usuário por email
O sistema SHALL fornecer `UserService.getUserByEmail(String email)` que consulta todos os nós em `user/` no Realtime Database e retorna o primeiro `UserModel` cujo campo `email` corresponda (case-insensitive), ou `null` se não encontrado.

#### Scenario: Usuário encontrado por email
- **WHEN** `getUserByEmail` é chamado com email cadastrado
- **THEN** retorna o `UserModel` correspondente com todos os campos preenchidos

#### Scenario: Usuário não encontrado
- **WHEN** `getUserByEmail` é chamado com email não cadastrado
- **THEN** retorna `null`

### Requirement: LoginViewModel expõe perfil do usuário logado
O sistema SHALL armazenar o `UserModel` retornado por `getUserByEmail` em `LoginViewModel` após autenticação bem-sucedida, exposto via getter `loggedUser`.

#### Scenario: loggedUser preenchido após login
- **WHEN** `entrarComEmail` retorna `true`
- **THEN** `loggedUser` contém o `UserModel` correspondente ao email informado

#### Scenario: loggedUser nulo quando usuário não encontrado no banco
- **WHEN** Firebase Auth autentica mas `getUserByEmail` retorna `null`
- **THEN** `loggedUser` permanece `null` e login ainda retorna `true`

### Requirement: AlertDialog exibe dados do perfil do usuário
O sistema SHALL exibir no AlertDialog o nome do usuário (`loggedUser?.name`) quando disponível, além do email. Quando `loggedUser` for `null`, exibe apenas o email.

#### Scenario: AlertDialog com nome e email
- **WHEN** `loggedUser` não é `null`
- **THEN** AlertDialog exibe "Bem-vindo, {nome}" e email

#### Scenario: AlertDialog somente com email
- **WHEN** `loggedUser` é `null`
- **THEN** AlertDialog exibe apenas o email do usuário
