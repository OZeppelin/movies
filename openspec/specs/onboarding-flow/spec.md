# Spec: onboarding-flow

## Purpose

TBD — Fluxo de onboarding exibido na primeira abertura do app, apresentando funcionalidades ao usuário antes de direcioná-lo para o login/cadastro.

## Requirements

### Requirement: Onboarding exibe 3 slides sequenciais
A `OnboardingScreen` SHALL exibir 3 slides via `PageView`, cada um com: header colorido de 380px altura (full width), ícone emoji de 80px centralizado no header, título Inter Bold 28px `#1A1A2E` (left 40px), e subtítulo Inter Regular 16px `#8C8C94` (left 40px). Fundo geral `#FAFAFA`.

#### Scenario: Slide 1 — Descubra filmes
- **WHEN** o app é iniciado e `OnboardingScreen` é renderizada
- **THEN** o slide 1 SHALL exibir header `#F5EBCC`, ícone 🎬, título "Descubra filmes incríveis", subtítulo "Explore milhares de títulos, trailers e resenhas."

#### Scenario: Slide 2 — Avalie e crie watchlist
- **WHEN** o usuário navega para o slide 2
- **THEN** SHALL exibir header `#E0F0FA`, ícone ⭐, título "Avalie e crie sua watchlist", subtítulo "Salve o que quer assistir e compartilhe suas notas."

#### Scenario: Slide 3 — Tudo pronto
- **WHEN** o usuário navega para o slide 3
- **THEN** SHALL exibir header `#E0FAE5`, ícone 🍿, título "Tudo pronto para começar", subtítulo "Crie sua conta e comece a explorar agora mesmo."

### Requirement: Dots de progresso sincronizados
A `OnboardingScreen` SHALL exibir 3 dots de progresso abaixo do subtítulo. O dot correspondente ao slide atual SHALL ser um retângulo 20×8px `#F5C142`; os demais SHALL ser círculos 8×8px `#D1D1D1`.

#### Scenario: Dot ativo reflete slide atual
- **WHEN** o usuário está no slide N (1, 2 ou 3)
- **THEN** o dot N SHALL ser retângulo 20×8px `#F5C142`
- **THEN** os demais dots SHALL ser círculos 8×8px `#D1D1D1`

### Requirement: Navegação entre slides e saída do onboarding
Nos slides 1 e 2, o botão "Próximo" SHALL avançar para o próximo slide. No slide 3, o botão "Começar" SHALL navegar para a `SplashScreen` via `Navigator.pushReplacement`, removendo o onboarding da pilha de navegação.

#### Scenario: Botão Próximo avança slide
- **WHEN** o usuário toca "Próximo" no slide 1 ou 2
- **THEN** o `PageView` SHALL avançar para o próximo slide com animação

#### Scenario: Botão Começar navega para Splash
- **WHEN** o usuário toca "Começar" no slide 3
- **THEN** a `SplashScreen` SHALL ser aberta via `Navigator.pushReplacement`
- **THEN** o botão de voltar do sistema NÃO SHALL retornar ao onboarding

#### Scenario: Swipe entre slides
- **WHEN** o usuário desliza horizontalmente na `OnboardingScreen`
- **THEN** o `PageView` SHALL navegar entre os slides e os dots SHALL se atualizar
