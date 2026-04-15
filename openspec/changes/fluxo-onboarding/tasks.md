## 1. AppColors — Novas cores de header

- [x] 1.1 Adicionar `onboarding1Header` (`#F5EBCC`) ao `AppColors`
- [x] 1.2 Adicionar `onboarding2Header` (`#E0F0FA`) ao `AppColors`
- [x] 1.3 Adicionar `onboarding3Header` (`#E0FAE5`) ao `AppColors`

## 2. Criar OnboardingScreen

- [x] 2.1 Criar `lib/views/screens/onboarding_screen.dart` com `StatefulWidget` `OnboardingScreen`
- [x] 2.2 Implementar `PageController` e `_currentPage` com `setState` no `onPageChanged`
- [x] 2.3 Criar widget privado `_OnboardingSlide` com parâmetros: `headerColor`, `emoji`, `title`, `subtitle`
- [x] 2.4 Implementar layout do slide: header 380px full-width com emoji 80px centralizado
- [x] 2.5 Implementar título Inter Bold 28px `AppColors.dark` com padding left 40px
- [x] 2.6 Implementar subtítulo Inter Regular 16px `AppColors.textSecondary` com padding left 40px
- [x] 2.7 Implementar dots de progresso com `AnimatedContainer`: ativo 20×8px `AppColors.primary`, inativo 8×8px `AppColors.inputBorder`
- [x] 2.8 Implementar `PageView` com os 3 slides usando `_OnboardingSlide`
- [x] 2.9 Implementar botão "Próximo" (slides 1 e 2) que chama `pageController.nextPage`
- [x] 2.10 Implementar botão "Começar" (slide 3) que chama `Navigator.pushReplacement` para `SplashScreen`

## 3. Atualizar main.dart

- [x] 3.1 Importar `OnboardingScreen` em `main.dart`
- [x] 3.2 Trocar `home` de `SplashScreen` para `OnboardingScreen` mantendo o `Builder` e o callback `onForgotPassword` acessível via `SplashScreen`
