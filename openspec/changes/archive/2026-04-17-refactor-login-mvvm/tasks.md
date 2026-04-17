## 1. Criar LoginViewModel

- [x] 1.1 Criar `lib/viewmodels/login_view_model.dart` estendendo `BaseViewModel`
- [x] 1.2 Adicionar `String? _errorMessage` com getter `errorMessage` e método `clearError()`
- [x] 1.3 Implementar `bool validateFields(String email, String senha)` — seta `errorMessage` e retorna `false` se algum campo vazio
- [x] 1.4 Implementar `Future<bool> entrarComEmail(String email, String senha)` com `setLoading`, Firebase Auth e try/catch
- [x] 1.5 Implementar `Future<bool> entrarComGoogle()` com `GoogleSignIn.instance.authenticate()` e `signInWithCredential`
- [x] 1.6 Implementar `Future<bool> entrarComApple()` com `SignInWithApple.getAppleIDCredential` e `OAuthProvider`

## 2. Refatorar LoginScreen

- [x] 2.1 Adicionar import de `provider` e `LoginViewModel` em `login_screen.dart`
- [x] 2.2 Remover imports de `firebase_auth`, `google_sign_in`, `sign_in_with_apple` da View
- [x] 2.3 Envolver o `build` com `ChangeNotifierProvider(create: (_) => LoginViewModel())`
- [x] 2.4 Substituir `bool _isLoading` local por `Consumer<LoginViewModel>` + `viewModel.isLoading`
- [x] 2.5 Substituir `_entrar()` local por `await viewModel.entrarComEmail(...)` + navegação condicional
- [x] 2.6 Substituir `_entrarGoogle()` local por `await viewModel.entrarComGoogle()` + navegação condicional
- [x] 2.7 Substituir `_entrarApple()` local por `await viewModel.entrarComApple()` + navegação condicional
- [x] 2.8 Implementar reação a `viewModel.errorMessage`: exibir SnackBar e chamar `viewModel.clearError()`

## 3. Verificação

- [x] 3.1 Executar `flutter analyze` e corrigir warnings
- [x] 3.2 Confirmar que `login_screen.dart` não contém imports de `firebase_auth`, `google_sign_in` ou `sign_in_with_apple`
- [x] 3.3 Executar o app no simulador iPhone 17 e verificar renderização da `LoginScreen`
