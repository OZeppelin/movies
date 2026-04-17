## MODIFIED Requirements

### Requirement: onboarding_screen.dart conecta onLogin da SplashScreen
O `onboarding_screen.dart` SHALL passar o callback `onLogin` à `SplashScreen` navegando para `LoginScreen` via `Navigator.push`.

#### Scenario: Callback onLogin conectado
- **WHEN** o usuário chega à `SplashScreen` via onboarding
- **THEN** o `onLogin` da `SplashScreen` SHALL navegar para `LoginScreen` via `Navigator.push`
- **THEN** `onForgotPassword` e `onRegister` SHALL continuar funcionando (sem regressão)
