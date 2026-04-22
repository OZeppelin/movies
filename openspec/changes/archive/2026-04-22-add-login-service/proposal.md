## Why

O fluxo de login deve realizar a autenticação através dos campos email e password, através do Realtime Database user, após a validação, exibir feedback visual ao usuário. É necessário adicionar a camada de serviço para a autenticação dos campos email e password e persistência do log e melhorar a UX com AlertDialog.


## What Changes

- Novo modelo `LogUserModel` com campos `idUser` e `createdAt`
- Nova classe `LoginService` para salvar entrada `logUser/{uid}` no Realtime Database
- Atualização do `LoginViewModel` para chamar `LoginService` após autenticação bem-sucedida
- Atualização de `login_screen.dart` para exibir `AlertDialog` com informações do usuário logado ou falha.

## Capabilities

### New Capabilities
- `login-auth`: Serviço de login que realiza a autenticação do usuário através dos campos email e password na tabela user no Realtime Database.
- `login-service`: Serviço de login que persiste log de acesso no Realtime Database após autenticação bem-sucedida

### Modified Capabilities
- (nenhuma)

## Impact

- `lib/models/log_user_model.dart` — novo arquivo
- `lib/services/login_service.dart` — novo arquivo
- `lib/viewmodels/login_view_model.dart` — integração com LoginService
- `lib/views/screens/login_screen.dart` — AlertDialog no lugar de navegação direta
