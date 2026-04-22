## 1. ViewModel

- [x] 1.1 Em `LoginViewModel.entrarComEmail`, substituir `FirebaseAuth.signInWithEmailAndPassword` por chamada a `_userService.getUserByEmail(email)`
- [x] 1.2 Validar senha comparando `user.password == senha`; se usuário não encontrado ou senha incorreta, definir `_errorMessage = 'Email ou senha inválidos'` e retornar `false`
- [x] 1.3 Em caso de sucesso, definir `_loggedUser = user` e chamar `_loginService.saveLog` com `idUser = user.id` e `createdAt = DateTime.now().toIso8601String()` (falha no log não bloqueia retorno `true`)
- [x] 1.4 Remover import de `firebase_auth` se não for mais usado por `entrarComEmail` (verificar se ainda é necessário para Google/Apple)
