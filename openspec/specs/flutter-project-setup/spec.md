# Spec: Flutter Project Setup

## Purpose

Definir a estrutura inicial do projeto Flutter com arquitetura MVVM, incluindo a organização de diretórios, dependências essenciais, suporte multiplataforma e a classe base para ViewModels.

## Requirements

### Requirement: Estrutura de diretórios MVVM
O projeto Flutter SHALL ter sua pasta `lib/` organizada com as camadas `core/`, `models/`, `services/`, `viewmodels/` e `views/` (contendo `screens/` e `widgets/`), refletindo a separação de responsabilidades da arquitetura MVVM.

#### Scenario: Diretórios criados na inicialização
- **WHEN** o projeto Flutter é criado
- **THEN** a pasta `lib/` SHALL conter os subdiretórios `core/`, `models/`, `services/`, `viewmodels/`, `views/screens/` e `views/widgets/`

### Requirement: Arquivo main.dart na raiz de lib
O arquivo `lib/main.dart` SHALL existir na raiz de `lib/`, ser o ponto de entrada da aplicação, e definir a `SplashScreen` como tela inicial do `MaterialApp`.

#### Scenario: Arquivo main.dart na raiz de lib
- **WHEN** o projeto Flutter é criado
- **THEN** o arquivo `lib/main.dart` SHALL existir na raiz de `lib/` e ser o ponto de entrada da aplicação

#### Scenario: SplashScreen definida como home
- **WHEN** o app Flutter é iniciado
- **THEN** o `MaterialApp` SHALL ter `home: SplashScreen()` como tela inicial
- **THEN** a `SplashScreen` SHALL ser a primeira tela visível ao usuário

### Requirement: Dependência do Provider para state management
O projeto Flutter SHALL declarar `provider` como dependência no `pubspec.yaml` para suportar a comunicação entre ViewModels e Views.

#### Scenario: Provider presente no pubspec.yaml
- **WHEN** o `pubspec.yaml` é examinado
- **THEN** a dependência `provider` SHALL estar listada em `dependencies`

### Requirement: Suporte multiplataforma iOS e Android
O projeto Flutter SHALL ser configurado para compilar e executar nas plataformas iOS e Android sem configurações adicionais de plataforma.

#### Scenario: Build iOS bem-sucedido
- **WHEN** o comando `flutter build ios --no-codesign` é executado
- **THEN** o build SHALL concluir sem erros de configuração de plataforma

#### Scenario: Build Android bem-sucedido
- **WHEN** o comando `flutter build apk` é executado
- **THEN** o build SHALL concluir sem erros de configuração de plataforma

### Requirement: ViewModel base com ChangeNotifier
O projeto SHALL fornecer uma classe base `BaseViewModel` que estende `ChangeNotifier`, a ser herdada por todos os ViewModels da aplicação.

#### Scenario: BaseViewModel disponível para herança
- **WHEN** um novo ViewModel é criado
- **THEN** ele SHALL poder herdar de `BaseViewModel` localizado em `lib/viewmodels/base_view_model.dart`

#### Scenario: Notificação de mudança de estado
- **WHEN** um ViewModel chama `notifyListeners()`
- **THEN** todas as Views registradas SHALL receber a atualização e reconstruir os widgets afetados

### Requirement: main.dart conecta onRegister da SplashScreen
O `main.dart` SHALL passar o callback `onRegister` à `SplashScreen` navegando para `CriarContaStep1Screen` via `Navigator.push`.

#### Scenario: Callback onRegister conectado
- **WHEN** o app é iniciado e `SplashScreen` é renderizada via `OnboardingScreen`
- **THEN** o `onRegister` da `SplashScreen` SHALL estar conectado a uma navegação `Navigator.push` para `CriarContaStep1Screen`
- **THEN** o `onForgotPassword` SHALL continuar conectado a `EsqueciSenhaScreen` (sem regressão)

### Requirement: onboarding_screen.dart conecta onLogin da SplashScreen
O `onboarding_screen.dart` SHALL passar o callback `onLogin` à `SplashScreen` navegando para `LoginScreen` via `Navigator.push`.

#### Scenario: Callback onLogin conectado
- **WHEN** o usuário chega à `SplashScreen` via onboarding
- **THEN** o `onLogin` da `SplashScreen` SHALL navegar para `LoginScreen` via `Navigator.push`
- **THEN** `onForgotPassword` e `onRegister` SHALL continuar funcionando (sem regressão)
