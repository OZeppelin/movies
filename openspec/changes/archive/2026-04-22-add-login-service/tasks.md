## 1. Modelos

- [x] 1.1 Criar `lib/models/log_user_model.dart` com campos `idUser` e `createdAt`, métodos `toMap` e `fromMap`

## 2. Serviço

- [x] 2.1 Criar `lib/services/login_service.dart` com método `saveLog(LogUserModel)` que salva em `logUser/{idUser}` via `DatabaseFirebase.instance`
- [x] 2.2 Adicionar método `getUserByEmail(String email)` em `lib/services/user_service.dart` que consulta `user/` e retorna o `UserModel` com email correspondente ou `null`

## 3. ViewModel

- [x] 3.1 Atualizar `lib/viewmodels/login_view_model.dart`: instanciar `LoginService` e chamar `saveLog` após `entrarComEmail` bem-sucedido (falha no log não bloqueia o retorno `true`)
- [x] 3.2 Em `LoginViewModel`, após auth bem-sucedida, chamar `UserService.getUserByEmail` e armazenar resultado em `loggedUser` (getter público, `null` se não encontrado)

## 4. UI

- [x] 4.1 Atualizar `lib/views/screens/login_screen.dart`: após `entrarComEmail` retornar `true`, exibir `AlertDialog` com email do usuário; ao fechar, navegar via `Navigator.popUntil(isFirst)`
- [x] 4.2 Atualizar AlertDialog para exibir nome do usuário quando `vm.loggedUser != null` ("Bem-vindo, {nome}" + email) ou apenas email quando `null`
