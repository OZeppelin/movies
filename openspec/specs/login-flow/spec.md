# Login Flow

## Purpose

Define the complete authentication flow as 11 navigable Figma frames in the "movieApp DS — Login Flow" file, covering Splash, Onboarding, Registration (3 steps), OTP verification, Login, Biometric authentication, and Password recovery — all connected via prototype flows and built with Library components.

## Requirements

### Requirement: Fluxo completo de autenticação em 11 telas Figma

O sistema SHALL criar 11 frames no arquivo "movieApp DS — Login Flow" representando o fluxo completo de autenticação, conectados via protótipo navegável, consumindo componentes da Library. Todos os campos de input (TextField) nas telas SHALL ter largura de `W - 48px` (327px para tela de 375px), alinhados com `x = 24px`, mantendo consistência visual com os botões CTA.

#### Scenario: Tela Splash presente e configurada

- **WHEN** o arquivo Login Flow é aberto
- **THEN** SHALL existir frame `01-Splash` com logo do movieApp, ícone de filme/clapperboard, e dois CTAs: "Entrar" e "Criar conta"

#### Scenario: Onboarding com 3 slides

- **WHEN** o usuário acessa o Onboarding
- **THEN** SHALL existir frames `02-Onboarding-1`, `03-Onboarding-2`, `04-Onboarding-3`
- **THEN** cada slide SHALL ter ilustração, título (`textTheme/titleLarge`), subtítulo (`textTheme/bodyMedium`) e indicador de progresso (dots)
- **THEN** último slide SHALL ter botão "Começar" (Button Primary)

#### Scenario: Cadastro em 3 steps

- **WHEN** o usuário acessa o fluxo de Cadastro
- **THEN** SHALL existir frames `05-Cadastro-Step1` (Nome + Telefone), `06-Cadastro-Step2` (Email + Senha), `07-Cadastro-Step3` (Confirmação + Avatar opcional)
- **THEN** cada step SHALL exibir indicador de progresso (ex: "Passo 1 de 3")
- **THEN** campos SHALL usar componente Input da Library
- **THEN** todos os campos de Input SHALL ter largura de 327px e `x = 24px`

#### Scenario: Verificação OTP

- **WHEN** o usuário conclui o Cadastro Step 3
- **THEN** SHALL existir frame `08-OTP` com campo de 6 dígitos, mensagem indicando o canal (SMS/Email) e opção "Reenviar código"

#### Scenario: Tela de Login

- **WHEN** o usuário escolhe "Entrar" no Splash
- **THEN** SHALL existir frame `09-Login` com campos Email e Senha, botão "Entrar" (Primary), link "Esqueci minha senha", e opções de social login (Google, Apple, Facebook)
- **THEN** os campos Email e Senha SHALL ter largura de 327px e `x = 24px`

#### Scenario: Autenticação biométrica

- **WHEN** o usuário tem biometria configurada
- **THEN** SHALL existir frame `10-Biometria` com ícone de fingerprint/face, texto explicativo e opção de fallback para senha

#### Scenario: Recuperação de senha

- **WHEN** o usuário clica em "Esqueci minha senha"
- **THEN** SHALL existir frame `11-Esqueci-Senha` com campo de email com largura de 327px e `x = 24px`, botão "Enviar link" e confirmação visual de envio

#### Scenario: Telas conectadas via protótipo

- **WHEN** o protótipo é executado no Figma
- **THEN** as 11 telas SHALL estar conectadas com flows de navegação: Splash → Onboarding → Cadastro → OTP → Home; Splash → Login → Biometria → Home; Login → Esqueci Senha

#### Scenario: Telas usam componentes da Library

- **WHEN** qualquer tela do Login Flow é inspecionada
- **THEN** botões, inputs e outros elementos SHALL ser instâncias dos componentes da Library, não elementos avulsos

#### Scenario: Campos de input com largura padronizada

- **WHEN** qualquer frame de Input é inspecionado nas telas do Login Flow
- **THEN** o frame SHALL ter `width = 327px` e `x = 24px`
- **THEN** o campo SHALL se estender visualmente da margem esquerda à margem direita com padding simétrico de 24px

### Requirement: Layout da LoginScreen
A `LoginScreen` SHALL exibir: logo circular 40px `AppColors.primary` com emoji 🎬 no topo centralizado, nome "movieApp" Inter Bold 28px `#1A1A2E` centralizado, título "Bem-vindo de volta" Inter Bold 24px `#1A1A2E` left 24px, campos Email e Senha, link "Esqueci minha senha" alinhado à direita em `AppColors.primary`, botão "Entrar" amarelo full-width, divisor "ou", botões "Continue com Google" e "Continue com Apple" (somente iOS), e link "Não tem conta? Criar agora" no rodapé.

#### Scenario: Renderização da LoginScreen
- **WHEN** o usuário toca "Entrar" na `SplashScreen`
- **THEN** a `LoginScreen` SHALL ser aberta via `Navigator.push`
- **THEN** SHALL exibir logo 🎬, campos Email e Senha, botão "Entrar", botões Google/Apple e link de cadastro

### Requirement: Validação de campos obrigatórios
Antes de chamar Firebase, a `LoginScreen` SHALL verificar se email e senha foram preenchidos.

#### Scenario: Campos vazios
- **WHEN** o usuário toca "Entrar" com email ou senha vazio
- **THEN** SHALL exibir `SnackBar` com "Preencha email e senha"
- **THEN** NÃO SHALL chamar Firebase Auth

### Requirement: Login com email e senha
O botão "Entrar" SHALL autenticar via `FirebaseAuth.instance.signInWithEmailAndPassword`.

#### Scenario: Login bem-sucedido
- **WHEN** o usuário preenche email e senha válidos e toca "Entrar"
- **THEN** SHALL chamar `signInWithEmailAndPassword`
- **THEN** em sucesso SHALL executar `Navigator.popUntil((r) => r.isFirst)`

#### Scenario: Erro de autenticação
- **WHEN** Firebase retorna `FirebaseAuthException`
- **THEN** SHALL exibir `SnackBar` com a mensagem de erro
- **THEN** o botão SHALL sair do estado de loading

#### Scenario: Loading state
- **WHEN** a chamada Firebase está em andamento
- **THEN** o botão "Entrar" SHALL exibir `CircularProgressIndicator` e SHALL estar desabilitado

### Requirement: Link "Esqueci minha senha"
O link "Esqueci minha senha" SHALL navegar para `EsqueciSenhaScreen`.

#### Scenario: Navegação para EsqueciSenhaScreen
- **WHEN** o usuário toca "Esqueci minha senha"
- **THEN** a `EsqueciSenhaScreen` SHALL ser aberta via `Navigator.push`

### Requirement: Login com Google
O botão "Continue com Google" SHALL autenticar via Google Sign-In + Firebase.

#### Scenario: Google Sign-In bem-sucedido
- **WHEN** o usuário toca "Continue com Google"
- **THEN** SHALL iniciar fluxo `GoogleSignIn().signIn()`
- **THEN** SHALL criar `GoogleAuthProvider.credential` e chamar `signInWithCredential`
- **THEN** em sucesso SHALL executar `Navigator.popUntil((r) => r.isFirst)`

#### Scenario: Google Sign-In cancelado
- **WHEN** o usuário cancela o fluxo Google
- **THEN** NÃO SHALL navegar; NÃO SHALL exibir erro

### Requirement: Login com Apple (somente iOS)
O botão "Continue com Apple" SHALL ser exibido somente em iOS e autenticar via Apple Sign-In + Firebase.

#### Scenario: Apple Sign-In bem-sucedido
- **WHEN** o usuário toca "Continue com Apple" no iOS
- **THEN** SHALL iniciar fluxo `SignInWithApple.getAppleIDCredential`
- **THEN** SHALL criar `OAuthProvider("apple.com").credential` e chamar `signInWithCredential`
- **THEN** em sucesso SHALL executar `Navigator.popUntil((r) => r.isFirst)`

#### Scenario: Botão Apple oculto no Android
- **WHEN** a `LoginScreen` é renderizada em Android
- **THEN** o botão "Continue com Apple" NÃO SHALL ser exibido

### Requirement: Link "Não tem conta? Criar agora"
O link no rodapé SHALL navegar para o fluxo de criação de conta.

#### Scenario: Navegação para criação de conta
- **WHEN** o usuário toca "Não tem conta? Criar agora"
- **THEN** a `CriarContaStep1Screen` SHALL ser aberta via `Navigator.push`
