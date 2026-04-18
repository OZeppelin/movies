## 1. Criar UserViewModel

- [ ] 1.1 Criar `lib/viewmodels/user_view_model.dart` estendendo `BaseViewModel`
- [ ] 1.2 Adicionar campos privados `_name`, `_numberPhone`, `_email`, `_password` com `_errorMessage` + getter `errorMessage` e método `clearError()`
- [ ] 1.3 Implementar `void saveStep1(String name, String numberPhone)` — armazena em memória sem `notifyListeners`
- [ ] 1.4 Implementar `void saveStep2(String email, String password)` — armazena em memória sem `notifyListeners`
- [ ] 1.5 Implementar `bool validateStep1(String name, String numberPhone)` — nome não vazio, telefone com 10+ dígitos extraídos
- [ ] 1.6 Implementar `bool validateStep2(String email, String password, String confirmPassword)` — email regex, senha 6+ chars, confirmação igual
- [ ] 1.7 Implementar `Future<bool> createUser()` — `setLoading`, `getDeviceId`, monta `UserModel`, `FirebaseAuth.createUserWithEmailAndPassword`, `UserService.createUser`, try/catch

## 2. Refatorar CriarContaStep1Screen

- [ ] 2.1 Adicionar import de `provider` e `UserViewModel`
- [ ] 2.2 Envolver o widget raiz com `ChangeNotifierProvider(create: (_) => UserViewModel())`
- [ ] 2.3 Substituir `onPressed` do botão "Continuar" por: `Consumer<UserViewModel>` + `validateStep1` + `saveStep1` + `SnackBar` de erro + navegação passando `viewModel`

## 3. Refatorar CriarContaStep2Screen

- [ ] 3.1 Adicionar parâmetro `required UserViewModel viewModel` ao construtor
- [ ] 3.2 Remover lógica de validação `_onContinuar()` da View (comparação inline de senhas)
- [ ] 3.3 Substituir `onPressed` por: `validateStep2` + `saveStep2` + `SnackBar` de erro + navegação passando `viewModel`

## 4. Refatorar CriarContaStep3Screen

- [ ] 4.1 Adicionar parâmetro `required UserViewModel viewModel` ao construtor
- [ ] 4.2 Remover import de `firebase_auth` e variável `_isLoading` local
- [ ] 4.3 Substituir `_criarConta()` por `Consumer<UserViewModel>` + `viewModel.createUser()` + `SnackBar` de erro + `Navigator.popUntil`
- [ ] 4.4 Implementar loading state no botão via `viewModel.isLoading`

## 5. Verificação

- [ ] 5.1 Executar `flutter analyze` e corrigir warnings
- [ ] 5.2 Confirmar que nenhuma das três telas contém import de `firebase_auth` ou lógica de validação
- [ ] 5.3 Executar o app no simulador iPhone 17 e navegar pelo fluxo completo de criação de conta e preenchendo com dados correspondentes aos campos
