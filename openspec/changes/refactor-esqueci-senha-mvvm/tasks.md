## 1. Criar EsqueciSenhaViewModel

- [ ] 1.1 Criar `lib/viewmodels/esqueci_senha_view_model.dart` estendendo `BaseViewModel`
- [ ] 1.2 Adicionar `String? _errorMessage` com getter `errorMessage` e método `clearError()`
- [ ] 1.3 Implementar `bool _validateEmail(String email)` — retorna `false` e seta `errorMessage` se vazio ou formato inválido (regex)
- [ ] 1.4 Implementar `Future<bool> enviarLinkRecuperacao(String email)` com `setLoading`, `_validateEmail`, `FirebaseAuth.instance.sendPasswordResetEmail` e try/catch

## 2. Refatorar EsqueciSenhaScreen

- [ ] 2.1 Adicionar import de `provider` e `EsqueciSenhaViewModel` em `esqueci_senha_screen.dart`
- [ ] 2.2 Envolver o `build` com `ChangeNotifierProvider(create: (_) => EsqueciSenhaViewModel())`
- [ ] 2.3 Substituir `StatefulWidget` interno por `Consumer<EsqueciSenhaViewModel>` para acessar `viewModel`
- [ ] 2.4 Substituir `onPressed: () {}` por chamada a `viewModel.enviarLinkRecuperacao(emailController.text)` + reação condicional (SnackBar sucesso + pop / SnackBar erro + clearError)
- [ ] 2.5 Implementar estado de loading no botão: exibir `CircularProgressIndicator` e desabilitar quando `viewModel.isLoading == true`

## 3. Verificação

- [ ] 3.1 Executar `flutter analyze` e corrigir warnings
- [ ] 3.2 Confirmar que `esqueci_senha_screen.dart` não contém imports de `firebase_auth` nem lógica de validação
- [ ] 3.3 Executar o app no simulador iPhone 17 e verificar renderização e comportamento da `EsqueciSenhaScreen`
