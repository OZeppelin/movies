### Requirement: LogUserModel representa registro de acesso
O sistema SHALL definir `LogUserModel` com campos `idUser` (String) e `createdAt` (String ISO 8601), com métodos `toMap` e `fromMap`.

#### Scenario: Serialização para mapa
- **WHEN** `toMap()` é chamado em um `LogUserModel`
- **THEN** retorna mapa com chaves `idUser` e `createdAt`

### Requirement: LoginService persiste log de acesso
O sistema SHALL fornecer `LoginService` com método `saveLog(LogUserModel)` que salva o modelo em `logUser/{idUser}` no Realtime Database via `DatabaseFirebase.instance`.

#### Scenario: Log salvo com sucesso
- **WHEN** `saveLog` é chamado com modelo válido
- **THEN** o nó `logUser/{idUser}` é criado/atualizado no Realtime Database

### Requirement: LoginViewModel integra LoginService após autenticação
O sistema SHALL, após autenticação bem-sucedida via `entrarComEmail`, chamar `LoginService.saveLog` com o uid do usuário autenticado e timestamp atual.

#### Scenario: Login com email bem-sucedido salva log
- **WHEN** `entrarComEmail` autentica com sucesso
- **THEN** `LoginService.saveLog` é chamado com `idUser = uid` e `createdAt = DateTime.now().toIso8601String()`

#### Scenario: Falha no log não bloqueia login
- **WHEN** `saveLog` lança exceção
- **THEN** o login ainda retorna `true` e não exibe erro ao usuário

### Requirement: login_screen exibe AlertDialog após login bem-sucedido
O sistema SHALL exibir um `AlertDialog` com o email do usuário logado após `entrarComEmail` retornar `true`. Após fechar o dialog, navega via `Navigator.popUntil(isFirst)`.

#### Scenario: AlertDialog exibido com email
- **WHEN** login é bem-sucedido
- **THEN** AlertDialog é exibido com título "Login realizado" e corpo contendo o email do usuário

#### Scenario: Navegação após fechar dialog
- **WHEN** usuário fecha o AlertDialog
- **THEN** app navega para a primeira rota da pilha
