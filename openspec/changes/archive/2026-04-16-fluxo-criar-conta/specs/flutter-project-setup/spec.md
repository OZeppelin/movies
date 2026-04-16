## MODIFIED Requirements

### Requirement: main.dart conecta onRegister da SplashScreen
O `main.dart` SHALL passar o callback `onRegister` à `SplashScreen` navegando para `CriarContaStep1Screen` via `Navigator.push`.

#### Scenario: Callback onRegister conectado
- **WHEN** o app é iniciado e `SplashScreen` é renderizada via `OnboardingScreen`
- **THEN** o `onRegister` da `SplashScreen` SHALL estar conectado a uma navegação `Navigator.push` para `CriarContaStep1Screen`
- **THEN** o `onForgotPassword` SHALL continuar conectado a `EsqueciSenhaScreen` (sem regressão)
