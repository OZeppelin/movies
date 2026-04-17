## Why

A `LoginScreen` atual concentra toda a lógica de negócio (validação, chamadas Firebase, Google Sign-In, Apple Sign-In) diretamente no `State` da View, violando a arquitetura MVVM do projeto. O refactoring extrai essa lógica para um `LoginViewModel` que estende `BaseViewModel`, deixando a View responsável apenas por UI e navegação.

## What Changes

- Criação de `LoginViewModel` (`lib/viewmodels/login_view_model.dart`) que estende `BaseViewModel` com:
  - Validação de campos (email e senha obrigatórios)
  - `entrarComEmail(email, senha)` → Firebase `signInWithEmailAndPassword`
  - `entrarComGoogle()` → Google Sign-In via `google_sign_in 7.x`
  - `entrarComApple()` → Apple Sign-In via `sign_in_with_apple`
  - `errorMessage` exposto via `notifyListeners` para a View exibir SnackBar
  - `isLoading` herdado de `BaseViewModel`
- Refactoring de `LoginScreen`:
  - Converte de `StatefulWidget` para `StatelessWidget` (estado gerenciado pelo ViewModel)
  - Usa `ChangeNotifierProvider` + `Consumer<LoginViewModel>`
  - Remove todas as importações de Firebase/Google/Apple — fica com apenas lógica de UI e navegação
  - Reage ao `errorMessage` do ViewModel para exibir SnackBar
  - Reage ao retorno dos métodos do ViewModel para chamar `Navigator.popUntil`

## Capabilities

### Modified Capabilities

- `login-flow`: Lógica de autenticação migrada para `LoginViewModel`; `LoginScreen` passa a ser View pura (UI + navegação)

## Impact

- **Arquivos criados**: `lib/viewmodels/login_view_model.dart`
- **Arquivos modificados**: `lib/views/screens/login_screen.dart`
- **Sem novas dependências** — `provider` já está no `pubspec.yaml`
- **Comportamento idêntico ao usuário** — nenhuma mudança visual ou funcional
