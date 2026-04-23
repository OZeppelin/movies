## MODIFIED Requirements

### Requirement: AppIcons centraliza os ícones visuais do design system
O sistema SHALL definir a classe `AppIcons` em `lib/core/app_icons.dart` com constantes `static const String` representando os **caminhos de asset PNG** para cada ícone visual do design system. Os arquivos PNG SHALL estar em `assets/icons/` e declarados no `pubspec.yaml`. Nenhuma dependência externa SHALL ser adicionada.

#### Scenario: Constante de app icon disponível
- **WHEN** qualquer widget precisar exibir o ícone principal do app (clapperboard)
- **THEN** SHALL referenciar `AppIcons.app` (valor: `'assets/icons/app.png'`) para uso com `Image.asset`

#### Scenario: Constante de biometria disponível
- **WHEN** qualquer widget precisar exibir o ícone de biometria (pointing hand)
- **THEN** SHALL referenciar `AppIcons.biometrics` (valor: `'assets/icons/biometrics.png'`)

#### Scenario: Constantes de onboarding disponíveis
- **WHEN** qualquer widget precisar exibir ícones ilustrativos do onboarding
- **THEN** SHALL referenciar `AppIcons.popcorn`, `AppIcons.star` ou `AppIcons.email` com seus respectivos caminhos de asset PNG

#### Scenario: Constante de navegação disponível
- **WHEN** qualquer widget precisar exibir o indicador de voltar
- **THEN** SHALL referenciar `AppIcons.back` (valor: `'assets/icons/back.png'`)

#### Scenario: Assets declarados no pubspec
- **WHEN** o projeto Flutter for compilado
- **THEN** os arquivos em `assets/icons/` SHALL estar declarados no `pubspec.yaml` para serem incluídos no bundle
