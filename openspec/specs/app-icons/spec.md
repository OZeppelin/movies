# app-icons

## Purpose

Define `AppIcons`, a centralized constants class in `lib/core/app_icons.dart` that maps all visual icons used in the movieApp design system (Figma: movieApp DS — Login Flow) to named Dart constants pointing to PNG asset paths.

## Requirements

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

### Requirement: Telas do projeto usam AppIcons em vez de emojis hardcoded
Todas as telas do projeto Flutter SHALL referenciar `AppIcons` para exibir ícones visuais. Strings de emoji hardcoded (`'🎬'`, `'⭐'`, `'🍿'`, `'✉'`, `'←'`) SHALL ser substituídas pelas constantes correspondentes de `AppIcons`. Ícones PNG SHALL ser renderizados via `Image.asset(AppIcons.x)` e o back arrow SHALL ser renderizado via `Text(AppIcons.back)`.

#### Scenario: Splash screen usa AppIcons.app
- **WHEN** a splash screen exibe o ícone do app
- **THEN** SHALL usar `Image.asset(AppIcons.app)` em vez de `Text('🎬')`

#### Scenario: Login screen usa AppIcons.app
- **WHEN** a login screen exibe o ícone do app
- **THEN** SHALL usar `Image.asset(AppIcons.app)` em vez de `Text('🎬')`

#### Scenario: Onboarding screen usa AppIcons para ilustrações
- **WHEN** o onboarding exibe os ícones dos slides
- **THEN** SHALL passar `AppIcons.app`, `AppIcons.star`, `AppIcons.popcorn` para o widget de slide, que os renderiza via `Image.asset`

#### Scenario: Telas de cadastro usam AppIcons.back
- **WHEN** qualquer tela de criar conta exibe o botão de voltar
- **THEN** SHALL referenciar `Text(AppIcons.back)` em vez de `Text('←')`

#### Scenario: Esqueci senha usa AppIcons para ícones
- **WHEN** a tela esqueci senha exibe o ícone de email e o botão de voltar
- **THEN** SHALL usar `Image.asset(AppIcons.email)` e `Text(AppIcons.back)`
