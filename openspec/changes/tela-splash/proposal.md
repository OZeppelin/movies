## Why

O projeto Flutter precisa da tela de entrada do app (Splash/Welcome) implementada em código, fiel ao design `01-Splash` do Figma. Esta é a primeira tela que o usuário vê ao abrir o app e direciona para o fluxo de autenticação.

## What Changes

- Criação da `SplashScreen` como widget Flutter em `lib/views/screens/splash_screen.dart`
- Tela com logo circular (fundo amarelo + ícone 🎬), nome do app, tagline e dois CTAs
- Botão "Entrar" navega para a tela de login (placeholder por enquanto)
- Botão "Criar conta" navega para o fluxo de cadastro (placeholder por enquanto)
- Link "Esqueci minha senha" abaixo dos botões
- `SplashScreen` definida como tela inicial no `main.dart`

## Capabilities

### New Capabilities

- `splash-screen`: Tela de boas-vindas do app com logo, tagline e CTAs de entrada/cadastro, fiel ao design Figma `01-Splash`

### Modified Capabilities

- `flutter-project-setup`: `main.dart` passa a usar `SplashScreen` como `home` em vez do `Scaffold` placeholder

## Impact

- **Arquivos criados**: `lib/views/screens/splash_screen.dart`
- **Arquivos modificados**: `lib/main.dart` (troca `home` para `SplashScreen`)
- **Dependências**: nenhuma nova — usa apenas widgets nativos do Flutter
- **Cores** (do Figma `01-Splash`):
  - Background: `#FAFAFA`
  - Primária/Botão: `#F5C142` (amarelo)
  - Texto escuro: `#1A1A2E` (navy)
  - Texto secundário: `#8C8C94` (cinza)
- **Tipografia**: Inter (Regular, Bold, SemiBold) — já disponível via Google Fonts ou como fonte do sistema
