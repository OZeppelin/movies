## ADDED Requirements

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
