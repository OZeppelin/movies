## Why

O movieApp não possui aplicativo mobile nativo, impedindo que usuários acessem o catálogo de filmes pelo smartphone. Implementar o app em React Native com Nova Arquitetura (JSI/Fabric) garante performance nativa e base sólida para evoluções futuras.

## What Changes

- Novo projeto React Native com Nova Arquitetura (JSI/Fabric) ativada por padrão
- Design System configurado a partir da biblioteca Figma (`movieApp-DS — Library`)
- Fluxo de Splash Screen com animação de entrada
- Fluxo de Onboarding com 3 telas e paginação por dots
- Fluxo de Cadastro multi-step (3 passos: dados pessoais → acesso → confirmação) com verificação OTP
- Tela de Login com email/senha, login social (Google/Apple) e link "Esqueci minha senha"
- Tela de Login Biométrico (Face ID / Touch ID)
- Tela de Recuperação de Senha por email

## Capabilities

### New Capabilities

- `design-system`: Tokens de cor, tipografia e espaçamento extraídos da biblioteca Figma (`movieApp-DS — Library`). Inclui configuração do tema via StyleSheet/tokens TypeScript, font Inter integrada.
- `onboarding-flow`: Splash screen + 3 telas de onboarding com paginação animada por dots. Persiste flag de "já viu onboarding" no AsyncStorage para não reexibir.
- `auth-login`: Tela de login com email e senha, login social via Google e Apple, link para recuperação de senha, e acesso biométrico (Face ID / Touch ID) via `react-native-biometrics`.
- `auth-register`: Fluxo de cadastro multi-step com barra de progresso (3 passos): dados pessoais (nome + telefone com máscara), acesso (email + senha + confirmação) e confirmação com foto de perfil opcional. Inclui tela de verificação OTP de 6 dígitos.
- `auth-forgot-password`: Tela de recuperação de senha via email com envio de link de redefinição e retorno ao login.
- `app-navigation`: Configuração do React Navigation (Stack + estrutura de rotas para fluxo de autenticação vs. app principal).

### Modified Capabilities

*(nenhuma — projeto novo)*

## Impact

- **Novo projeto**: React Native 0.85+ com `newArchEnabled=true` (JSI/Fabric/TurboModules)
- **Linguagem**: TypeScript strict
- **Dependências principais**: `react-navigation`, `react-native-screens`, `react-native-safe-area-context`, `react-native-biometrics`, `@react-native-async-storage/async-storage`, `react-native-masked-text`
- **Design System**: Fonte Inter (via `expo-font` ou link manual), tokens de cor e tipografia codificados como constantes TypeScript
- **Plataformas**: iOS 26+ e Android 8+ (API 26+)
- **Figma Login Flow**: `lT8Jhe8Q1HzH7yWgjFCUBh`
- **Figma DS Library**: `y1I12bNB9OsHCw6IU1h16e`
