## 1. Back arrow — Text(AppIcons.back)

- [x] 1.1 `criar_conta_step1_screen.dart` — substituir `'←'` por `AppIcons.back`
- [x] 1.2 `criar_conta_step2_screen.dart` — substituir `'←'` por `AppIcons.back`
- [x] 1.3 `criar_conta_step3_screen.dart` — substituir `'←'` por `AppIcons.back`
- [x] 1.4 `esqueci_senha_screen.dart` — substituir `'←'` por `AppIcons.back`

## 2. Ícones PNG — Image.asset(AppIcons.x)

- [x] 2.1 `splash_screen.dart` — substituir `Text('🎬')` por `Image.asset(AppIcons.app, width: 80)`
- [x] 2.2 `login_screen.dart` — substituir `Text('🎬')` por `Image.asset(AppIcons.app, width: 80)`
- [x] 2.3 `esqueci_senha_screen.dart` — substituir `Text('✉')` por `Image.asset(AppIcons.email, width: 80)`

## 3. Onboarding — asset paths + renderer

- [x] 3.1 `onboarding_screen.dart` — substituir valores de `emoji:` nos slides por `AppIcons.app`, `AppIcons.star`, `AppIcons.popcorn`
- [x] 3.2 `onboarding_screen.dart` — em `_OnboardingSlide.build`, substituir `Text(emoji, ...)` por `Image.asset(emoji, width: 80, fit: BoxFit.contain)`

## 4. Imports

- [x] 4.1 Adicionar `import '../../core/app_icons.dart'` em todos os arquivos alterados que ainda não o importam
