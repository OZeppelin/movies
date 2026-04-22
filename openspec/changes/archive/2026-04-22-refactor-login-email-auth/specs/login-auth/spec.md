## MODIFIED Requirements

### Requirement: LoginViewModel autentica email/senha via Realtime Database
O sistema SHALL autenticar o usuário em `entrarComEmail` buscando o registro na tabela `user/` do Realtime Database via `UserService.getUserByEmail` e comparando a senha informada com `UserModel.password`. Não SHALL usar `FirebaseAuth.signInWithEmailAndPassword` para este fluxo.

#### Scenario: Credenciais válidas — usuário encontrado e senha correta
- **WHEN** `entrarComEmail` é chamado com email e senha que correspondem a um registro em `user/`
- **THEN** `loggedUser` é preenchido com o `UserModel` e o método retorna `true`

#### Scenario: Email não cadastrado
- **WHEN** `getUserByEmail` retorna `null`
- **THEN** `errorMessage` é definido como `'Email ou senha inválidos'` e retorna `false`

#### Scenario: Senha incorreta
- **WHEN** usuário encontrado mas `user.password != senha`
- **THEN** `errorMessage` é definido como `'Email ou senha inválidos'` e retorna `false`

## MODIFIED Requirements

### Requirement: LoginViewModel integra LoginService após autenticação
O sistema SHALL, após autenticação bem-sucedida via Realtime Database, chamar `LoginService.saveLog` com `idUser = user.id` (UDID do device) e `createdAt = DateTime.now().toIso8601String()`.

#### Scenario: Log salvo com id do UserModel
- **WHEN** `entrarComEmail` autentica com sucesso
- **THEN** `LoginService.saveLog` é chamado com `idUser = loggedUser.id`

#### Scenario: Falha no log não bloqueia login
- **WHEN** `saveLog` lança exceção
- **THEN** o login ainda retorna `true`
