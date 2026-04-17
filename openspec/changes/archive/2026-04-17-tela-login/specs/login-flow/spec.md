## ADDED Requirements

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
