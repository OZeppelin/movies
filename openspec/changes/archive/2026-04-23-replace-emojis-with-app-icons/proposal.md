## Why

Com `AppIcons` implementado, os emojis ainda estão hardcoded nas telas como string literals. Centralizar via `AppIcons` garante consistência visual (PNG do Noto Emoji) e um único ponto de troca se os ícones mudarem.

## What Changes

- Telas que exibem 🎬, ⭐, 🍿, ✉ como `Text('emoji')` passam a usar `Image.asset(AppIcons.x)`
- Telas que exibem `←` como `Text('←')` passam a usar `Text(AppIcons.back)`
- `onboarding_screen.dart` — o parâmetro `emoji` (string) será avaliado para aceitar asset path e renderizar via `Image.asset`

## Capabilities

### New Capabilities
(nenhuma)

### Modified Capabilities
(nenhuma — mudança puramente de implementação; comportamento visual idêntico)

## Impact

- `lib/views/screens/splash_screen.dart`
- `lib/views/screens/login_screen.dart`
- `lib/views/screens/onboarding_screen.dart`
- `lib/views/screens/esqueci_senha_screen.dart`
- `lib/views/screens/criar_conta_step1_screen.dart`
- `lib/views/screens/criar_conta_step2_screen.dart`
- `lib/views/screens/criar_conta_step3_screen.dart`
