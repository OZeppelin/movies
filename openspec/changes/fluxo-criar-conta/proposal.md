## Why

O app precisa de um fluxo de criação de conta com 3 passos para registrar novos usuários via Firebase Authentication. O fluxo é acessado ao tocar "Criar conta" na `SplashScreen` e coleta nome, telefone, email e senha em etapas separadas, com uma tela de confirmação final antes de criar a conta.

## What Changes

- Criação de `CriarContaStep1Screen` (`lib/views/screens/criar_conta_step1_screen.dart`) — Nome completo + Telefone
- Criação de `CriarContaStep2Screen` (`lib/views/screens/criar_conta_step2_screen.dart`) — Email + Senha + Confirmar senha
- Criação de `CriarContaStep3Screen` (`lib/views/screens/criar_conta_step3_screen.dart`) — Avatar com iniciais, revisão de dados, botão "Criar minha conta" com Firebase Auth
- Atualização de `main.dart` para conectar `onRegister` da `SplashScreen` ao `CriarContaStep1Screen`
- Cada tela tem: progress bar de 3 segmentos, botão ← voltar, título "Criar conta", subtítulo "Passo N de 3 — …"

## Capabilities

### New Capabilities

- `criar-conta-flow`: Fluxo de 3 passos para registro de usuário com Firebase Authentication
  - Step 1: coleta nome completo e telefone
  - Step 2: coleta email, senha e confirmação de senha
  - Step 3: exibe avatar com iniciais, resumo dos dados, e cria conta via `FirebaseAuth.createUserWithEmailAndPassword`

### Modified Capabilities

- `flutter-project-setup`: `main.dart` passa a passar `onRegister` à `SplashScreen` para navegar ao `CriarContaStep1Screen`

## Impact

- **Arquivos criados**:
  - `lib/views/screens/criar_conta_step1_screen.dart`
  - `lib/views/screens/criar_conta_step2_screen.dart`
  - `lib/views/screens/criar_conta_step3_screen.dart`
- **Arquivos modificados**: `lib/main.dart` (conecta `onRegister`)
- **Dependências**: `firebase_auth` (já instalado via Firebase Core)
- **Navegação**:
  - `SplashScreen` → (onRegister) → `CriarContaStep1Screen` via `Navigator.push`
  - Step1 → Step2 via `Navigator.push`
  - Step2 → Step3 via `Navigator.push` (passa email, telefone, nome para Step3)
  - Step3 → Firebase `createUserWithEmailAndPassword` → pop até `SplashScreen` em caso de sucesso
- **Progress bar**: 3 retângulos 105×4px, ativos em `AppColors.primary` (`#F5C142`), inativos em `AppColors.inputBorder` (`#D1D1D1`), espaçados horizontalmente com gap de 6px a partir do left 24px
