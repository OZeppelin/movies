## Why

O método `entrarComEmail` atualmente usa Firebase Auth para autenticar, mas os usuários são cadastrados diretamente na tabela `user` do Realtime Database com email e senha. A autenticação deve validar as credenciais contra essa tabela, eliminando a dependência do Firebase Auth para o fluxo de email/senha.

## What Changes

- `LoginViewModel.entrarComEmail` deixa de usar `FirebaseAuth.signInWithEmailAndPassword`
- Autenticação passa a buscar o usuário por email em `user/` via `UserService.getUserByEmail` e comparar a senha
- Em caso de sucesso, salva log em `logUser` via `LoginService.saveLog` com `idUser` e `createdAt`
- Erros de credencial inválida são tratados com mensagem amigável

## Capabilities

### New Capabilities
(nenhuma)

### Modified Capabilities
- `login-auth`: autenticação de email/senha migra de Firebase Auth para validação direta na tabela `user` do Realtime Database

## Impact

- `lib/viewmodels/login_view_model.dart` — refatoração de `entrarComEmail`
- Import `firebase_auth` pode ser removido do escopo de `entrarComEmail` (mantido para Google/Apple)
