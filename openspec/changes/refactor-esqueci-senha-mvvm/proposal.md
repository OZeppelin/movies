## Why

A `EsqueciSenhaScreen` contém um botão "Enviar link de recuperação" com `onPressed: () {}` — sem implementação, sem validação e sem integração com Firebase Auth. Toda lógica de validação e envio deve residir em um `EsqueciSenhaViewModel`, mantendo consistência com o padrão MVVM já estabelecido no `LoginViewModel`.

## What Changes

- Criar `lib/viewmodels/esqueci_senha_view_model.dart` estendendo `BaseViewModel`
- Adicionar validação de email no ViewModel: campo vazio e formato inválido
- Implementar `Future<bool> enviarLinkRecuperacao(String email)` com `FirebaseAuth.instance.sendPasswordResetEmail`
- Refatorar `EsqueciSenhaScreen` para ser View pura: usar `ChangeNotifierProvider` + `Consumer<EsqueciSenhaViewModel>`
- Remover qualquer lógica de negócio da View; mover para o ViewModel
- Exibir `SnackBar` de erro para `viewModel.errorMessage` e SnackBar de sucesso ao enviar

## Capabilities

### New Capabilities
- `esqueci-senha-viewmodel`: ViewModel que encapsula validação de email e envio de link de recuperação via Firebase Auth

### Modified Capabilities
- `esqueci-senha-screen`: Requisitos de validação e comportamento do botão "Enviar link de recuperação" agora delegados ao ViewModel (MVVM)

## Impact

- Novo arquivo: `lib/viewmodels/esqueci_senha_view_model.dart`
- Modificado: `lib/views/screens/esqueci_senha_screen.dart`
- Dependência: `provider` (já presente no projeto), `firebase_auth` (já presente)
- Sem breaking changes na navegação ou contrato de UI
