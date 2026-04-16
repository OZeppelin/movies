## Why

O app precisa de uma tela de login para autenticar usuários já cadastrados via email/senha, Google e Apple. A tela é acessada pelo botão "Entrar" na `SplashScreen` e conecta ao Firebase Authentication.

## What Changes

- Criação de `LoginScreen` (`lib/views/screens/login_screen.dart`) com:
  - Logo + "movieApp" no topo
  - Campos Email e Senha com validação de campos obrigatórios
  - Link "Esqueci minha senha" → `EsqueciSenhaScreen`
  - Botão "Entrar" → Firebase `signInWithEmailAndPassword`
  - Divisor "ou"
  - Botão "Continue com Google" → Google Sign-In via Firebase
  - Botão "Continue com Apple" → Apple Sign-In via Firebase
  - Link "Não tem conta? Criar agora" → `CriarContaStep1Screen`
- Atualização de `onboarding_screen.dart` para conectar `onLogin` da `SplashScreen` ao `LoginScreen`
- Novas dependências: `google_sign_in`, `sign_in_with_apple`

## Capabilities

### New Capabilities

- `login-flow`: Tela de login com email/senha, Google e Apple via Firebase Authentication

### Modified Capabilities

- `flutter-project-setup`: `onboarding_screen.dart` passa a conectar `onLogin` à `LoginScreen` via `Navigator.push`

## Impact

- **Arquivos criados**: `lib/views/screens/login_screen.dart`
- **Arquivos modificados**: `lib/views/screens/onboarding_screen.dart` (adiciona `onLogin`)
- **Dependências novas**: `google_sign_in: ^6.2.1`, `sign_in_with_apple: ^7.0.1`
- **Navegação**:
  - `SplashScreen` → (onLogin) → `LoginScreen` via `Navigator.push`
  - `LoginScreen` → "Esqueci minha senha" → `EsqueciSenhaScreen` via `Navigator.push`
  - `LoginScreen` → "Não tem conta? Criar agora" → `CriarContaStep1Screen` via `Navigator.push`
  - Login bem-sucedido (qualquer método) → `Navigator.popUntil(isFirst)` retornando à `SplashScreen`
- **Design**:
  - Logo: círculo 40px `AppColors.primary` com emoji 🎬 18px, centralizado no topo
  - Botões Google/Apple: `OutlinedButton` branco com borda `AppColors.inputBorder`, prefixo "G" / ícone Apple
  - "Esqueci minha senha": alinhado à direita, 13px `AppColors.primary`
