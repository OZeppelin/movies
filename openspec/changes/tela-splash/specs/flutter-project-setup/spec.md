## MODIFIED Requirements

### Requirement: Arquivo main.dart na raiz de lib
O arquivo `lib/main.dart` SHALL existir na raiz de `lib/`, ser o ponto de entrada da aplicação, e definir a `SplashScreen` como tela inicial do `MaterialApp`.

#### Scenario: Arquivo main.dart na raiz de lib
- **WHEN** o projeto Flutter é criado
- **THEN** o arquivo `lib/main.dart` SHALL existir na raiz de `lib/` e ser o ponto de entrada da aplicação

#### Scenario: SplashScreen definida como home
- **WHEN** o app Flutter é iniciado
- **THEN** o `MaterialApp` SHALL ter `home: SplashScreen()` como tela inicial
- **THEN** a `SplashScreen` SHALL ser a primeira tela visível ao usuário
