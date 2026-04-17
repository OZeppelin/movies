## 1. Criar EsqueciSenhaViewModel

- [x] 1.1 Criar `lib/viewmodels/esqueci_senha_view_model.dart` estendendo `BaseViewModel`
- [x] 1.2 Adicionar `String? _errorMessage` com getter `errorMessage` e método `clearError()`
- [x] 1.3 Implementar `bool _validateEmail(String email)` — retorna `false` e seta `errorMessage` se vazio ou formato inválido (regex)
- [x] 1.4 Implementar `Future<bool> enviarLinkRecuperacao(String email)` com `setLoading`, `_validateEmail`, `FirebaseAuth.instance.sendPasswordResetEmail` e try/catch

## 2. Refatorar EsqueciSenhaScreen

- [x] 2.1 Adicionar import de `provider` e `EsqueciSenhaViewModel` em `esqueci_senha_screen.dart`
- [x] 2.2 Envolver o `build` com `ChangeNotifierProvider(create: (_) => EsqueciSenhaViewModel())`
- [x] 2.3 Substituir `StatefulWidget` interno por `Consumer<EsqueciSenhaViewModel>` para acessar `viewModel`
- [x] 2.4 Substituir `onPressed: () {}` por chamada a `viewModel.enviarLinkRecuperacao(emailController.text)` + reação condicional (SnackBar sucesso + pop / SnackBar erro + clearError)
- [x] 2.5 Implementar estado de loading no botão: exibir `CircularProgressIndicator` e desabilitar quando `viewModel.isLoading == true`

## 3. Verificação

- [x] 3.1 Executar `flutter analyze` e corrigir warnings
- [x] 3.2 Confirmar que `esqueci_senha_screen.dart` não contém imports de `firebase_auth` nem lógica de validação
- [x] 3.3 Executar o app no simulador iPhone 17 e verificar renderização e comportamento da `EsqueciSenhaScreen`
- [x] 3.4 Executar o app no simulador iPhone 17 e confirmar que a `OnboardingScreen` aparece corretamente
