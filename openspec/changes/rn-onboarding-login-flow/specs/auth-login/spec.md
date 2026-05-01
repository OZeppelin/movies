## ADDED Requirements

### Requirement: Tela de Login com email e senha
O sistema SHALL exibir a tela de Login (09-Login do Figma) com:
- Logo da app (ícone + "movieApp" em `titleLarge`)
- Título "Bem-vindo de volta" (`titleMedium`)
- Campo `AppInput` para Email
- Campo `AppInput` para Senha (com `secureTextEntry`)
- Link "Esqueci minha senha" alinhado à direita, cor `primary`
- Botão primário "Entrar"
- Separador "ou" com linhas laterais
- Botão outline "Continue com Google"
- Botão outline "Continue com Apple"
- Link "Não tem conta? Criar agora" no rodapé

#### Scenario: Campos vazios bloqueiam submit
- **WHEN** usuário toca "Entrar" com email ou senha vazios
- **THEN** mensagens de erro são exibidas nos campos e a requisição não é feita

#### Scenario: Email inválido exibe erro
- **WHEN** usuário insere texto sem formato de email válido e toca "Entrar"
- **THEN** `AppInput` de email exibe mensagem "Email inválido" em vermelho

#### Scenario: Credenciais corretas exibem toast e navegam para AppStack
- **WHEN** usuário insere credenciais válidas e toca "Entrar"
- **THEN** token é salvo no AsyncStorage, toast "Login realizado com sucesso!" é exibido via `react-native-toast-message` e app navega para AppStack

#### Scenario: Credenciais incorretas exibem erro
- **WHEN** API retorna erro 401
- **THEN** mensagem de erro genérica "Email ou senha incorretos" é exibida sem expor detalhes

---

### Requirement: Login Social com Google
O sistema SHALL permitir autenticação via Google Sign-In.

#### Scenario: Toque em "Continue com Google" abre fluxo OAuth
- **WHEN** usuário toca no botão "Continue com Google"
- **THEN** o fluxo OAuth do Google é iniciado via `@react-native-google-signin/google-signin`

#### Scenario: Google Sign-In cancelado não gera erro
- **WHEN** usuário cancela o fluxo Google Sign-In
- **THEN** o app retorna à tela de Login sem exibir erro

---

### Requirement: Login Social com Apple
O sistema SHALL permitir autenticação via Apple Sign-In (iOS apenas).

#### Scenario: Botão Apple exibido somente em iOS
- **WHEN** app roda em Android
- **THEN** botão "Continue com Apple" não é exibido

#### Scenario: Apple Sign-In bem-sucedido navega para AppStack
- **WHEN** usuário completa fluxo Apple Sign-In
- **THEN** token é salvo e app navega para AppStack

---

### Requirement: Login Biométrico
O sistema SHALL oferecer login biométrico (Face ID / Touch ID) na tela de Biometria (10-Biometria do Figma) após o primeiro login bem-sucedido.

#### Scenario: Biometria disponível exibe tela de configuração
- **WHEN** usuário faz login com email/senha pela primeira vez e dispositivo suporta biometria
- **THEN** tela "Acesso rápido" é exibida perguntando se quer ativar biometria

#### Scenario: Autenticação biométrica bem-sucedida
- **WHEN** usuário toca o sensor de biometria na tela de Biometria
- **THEN** app autentica com token salvo e navega para AppStack

#### Scenario: Biometria falha redireciona para senha
- **WHEN** autenticação biométrica falha 3 vezes
- **THEN** link "ou use sua senha" é destacado e toque nele navega para Login
