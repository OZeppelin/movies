## Why

O app precisa de um fluxo de onboarding com 3 slides para apresentar as funcionalidades ao usuário antes de levá-lo à tela de autenticação. O Onboarding substitui a `SplashScreen` como ponto de entrada do app — ao final (slide 3, botão "Começar"), o usuário chega à `SplashScreen` existente.

## What Changes

- Criação de `OnboardingScreen` em `lib/views/screens/onboarding_screen.dart` com `PageView` de 3 slides
- Cada slide tem: header colorido (380px), ícone emoji 80px, título Inter Bold 28px, subtítulo 16px, dots de progresso e botão
- Dots: dot ativo é retângulo 20×8px amarelo; inativos são círculos 8×8px cinza
- Botão dos slides 1 e 2: "Próximo" (avança o PageView); slide 3: "Começar" (navega para SplashScreen com `pushReplacement`)
- `main.dart` passa a usar `OnboardingScreen` como `home`
- 3 novas cores de header adicionadas ao `AppColors`

## Capabilities

### New Capabilities

- `onboarding-flow`: Fluxo de 3 slides de onboarding com PageView, dots de progresso e navegação para SplashScreen

### Modified Capabilities

- `flutter-project-setup`: `main.dart` passa a usar `OnboardingScreen` como `home` em vez de `SplashScreen`

## Impact

- **Arquivos criados**: `lib/views/screens/onboarding_screen.dart`
- **Arquivos modificados**: `lib/main.dart` (troca `home`), `lib/core/app_colors.dart` (3 novas cores)
- **Dependências**: nenhuma nova — `PageView` nativo do Flutter
- **Novas cores**:
  - `onboarding1Header`: `#F5EBCC` (creme amarelado)
  - `onboarding2Header`: `#E0F0FA` (azul claro)
  - `onboarding3Header`: `#E0FAE5` (verde claro)
- **Navegação**: `OnboardingScreen` → (Começar) → `SplashScreen` via `pushReplacement` (sem volta)
