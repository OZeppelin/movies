## Why

O app precisa da tela de recuperação de senha (`11-Esqueci-Senha` do Figma) para completar o fluxo de autenticação iniciado na Splash. O link "Esqueci minha senha" na `SplashScreen` já existe mas ainda não navega para lugar nenhum — esta mudança conecta os dois.

## What Changes

- Criação da `EsqueciSenhaScreen` em `lib/views/screens/esqueci_senha_screen.dart`
- Tela com botão voltar, título, ícone ✉, campo de email e botão de envio
- Navegação da `SplashScreen` para `EsqueciSenhaScreen` ao tocar em "Esqueci minha senha"
- Link "Lembrei minha senha — Entrar" na tela fecha/volta para a Splash

## Capabilities

### New Capabilities

- `esqueci-senha-screen`: Tela de recuperação de senha com campo de email e botão de envio, fiel ao design Figma `11-Esqueci-Senha`

### Modified Capabilities

- `splash-screen`: O callback `onForgotPassword` passa a navegar (via `Navigator.push`) para a `EsqueciSenhaScreen`

## Impact

- **Arquivos criados**: `lib/views/screens/esqueci_senha_screen.dart`
- **Arquivos modificados**: `lib/main.dart` (passa `onForgotPassword` para `SplashScreen` com navegação real)
- **Dependências**: nenhuma nova — `Navigator.push` nativo do Flutter
- **Cores novas** (do Figma `11-Esqueci-Senha`):
  - Background da tela: `#FFFFFF` (branco — diferente do `#FAFAFA` da Splash)
  - Input background: `#F5F5F5`
  - Input border: `#D1D1D1`
  - (demais cores já existem em `AppColors`)
