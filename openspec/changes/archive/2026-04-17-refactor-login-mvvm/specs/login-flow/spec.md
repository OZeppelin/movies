## MODIFIED Requirements

### Requirement: LoginViewModel encapsula toda lógica de autenticação
O `LoginViewModel` SHALL estender `BaseViewModel` e encapsular validação de campos e todas as chamadas de autenticação, expondo resultados via retorno `bool` e `errorMessage`.

#### Scenario: Validação de campos vazios no ViewModel
- **WHEN** `entrarComEmail` é chamado com email ou senha vazio
- **THEN** o ViewModel SHALL setar `errorMessage` com "Preencha email e senha"
- **THEN** SHALL chamar `notifyListeners()`
- **THEN** SHALL retornar `false`
- **THEN** NÃO SHALL chamar Firebase Auth

#### Scenario: Login email/senha bem-sucedido via ViewModel
- **WHEN** `entrarComEmail(email, senha)` é chamado com campos válidos
- **THEN** SHALL chamar `setLoading(true)`
- **THEN** SHALL chamar `FirebaseAuth.instance.signInWithEmailAndPassword`
- **THEN** em sucesso SHALL chamar `setLoading(false)` e retornar `true`

#### Scenario: Erro Firebase no ViewModel
- **WHEN** Firebase lança `FirebaseAuthException`
- **THEN** SHALL setar `errorMessage` com a mensagem do erro
- **THEN** SHALL chamar `notifyListeners()` e `setLoading(false)`
- **THEN** SHALL retornar `false`

#### Scenario: Google Sign-In via ViewModel
- **WHEN** `entrarComGoogle()` é chamado
- **THEN** SHALL chamar `GoogleSignIn.instance.authenticate()`
- **THEN** SHALL criar `GoogleAuthProvider.credential` e chamar `signInWithCredential`
- **THEN** em sucesso SHALL retornar `true`; em cancelamento SHALL retornar `false` sem setar `errorMessage`

#### Scenario: Apple Sign-In via ViewModel
- **WHEN** `entrarComApple()` é chamado
- **THEN** SHALL chamar `SignInWithApple.getAppleIDCredential`
- **THEN** SHALL criar `OAuthProvider("apple.com").credential` e chamar `signInWithCredential`
- **THEN** em sucesso SHALL retornar `true`; em cancelamento SHALL retornar `false` sem setar `errorMessage`

### Requirement: LoginScreen é View pura (UI + navegação)
A `LoginScreen` SHALL conter apenas construção de UI e lógica de navegação, sem imports de Firebase/Google/Apple.

#### Scenario: View reage a errorMessage
- **WHEN** `viewModel.errorMessage != null` após operação
- **THEN** a View SHALL exibir `SnackBar` com o texto de `errorMessage`
- **THEN** a View SHALL chamar `viewModel.clearError()` após exibir

#### Scenario: View navega após sucesso
- **WHEN** método do ViewModel retorna `true`
- **THEN** a View SHALL executar `Navigator.popUntil((r) => r.isFirst)`

#### Scenario: isLoading refletido na UI
- **WHEN** `viewModel.isLoading == true`
- **THEN** o botão "Entrar" SHALL exibir `CircularProgressIndicator` e estar desabilitado
