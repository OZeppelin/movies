## Why

O fluxo de criação de conta possui lógica de negócio espalhada nas Views: Step2 valida senhas diretamente no widget, e Step3 chama `FirebaseAuth.createUserWithEmailAndPassword` inline. Nenhuma das três telas valida campos obrigatórios antes de navegar. Centralizar essas responsabilidades em `UserViewModel` alinha o fluxo com o padrão MVVM já adotado no projeto (`LoginViewModel`, `EsqueciSenhaViewModel`) e conecta a criação de conta ao `UserService` para persistência no Realtime Database.

## What Changes

- Criar `lib/viewmodels/user_view_model.dart` estendendo `BaseViewModel`
- `UserViewModel` acumula dados das Steps em memória (`name`, `numberPhone`, `email`, `password`) e expõe validações por step e método `createUser()`
- Refatorar `CriarContaStep1Screen`: envolver com `ChangeNotifierProvider<UserViewModel>`, validar campos antes de navegar, passar ViewModel para Step2
- Refatorar `CriarContaStep2Screen`: receber `UserViewModel` via construtor, mover validação de senhas para o ViewModel, passar ViewModel para Step3
- Refatorar `CriarContaStep3Screen`: receber `UserViewModel` via construtor, substituir `_criarConta()` inline por `viewModel.createUser()`, remover import de `firebase_auth`

## Capabilities

### New Capabilities
- `user-view-model`: ViewModel que encapsula validações do fluxo de criação de conta, acumulação de dados em memória entre steps e criação de usuário via `UserService` + `FirebaseAuth`

### Modified Capabilities
- `criar-conta-flow`: Comportamento dos botões "Continuar" e "Criar minha conta" agora delegados ao `UserViewModel` (validação + persistência)

## Impact

- Novo arquivo: `lib/viewmodels/user_view_model.dart`
- Modificados: `criar_conta_step1_screen.dart`, `criar_conta_step2_screen.dart`, `criar_conta_step3_screen.dart`
- Depende de: `UserService`, `UserModel`, `BaseViewModel`, `provider` (todos já presentes)
- `firebase_auth` removido de `criar_conta_step3_screen.dart` (passa para o ViewModel)
