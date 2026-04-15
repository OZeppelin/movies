## MODIFIED Requirements

### Requirement: Tela Splash oferece CTAs de autenticação
A `SplashScreen` SHALL exibir dois botões de ação — "Entrar" (primário, fundo `#F5C142`) e "Criar conta" (secundário, outline `#1A1A2E`) — e um link "Esqueci minha senha", posicionados na parte inferior da tela. O link "Esqueci minha senha" SHALL acionar navegação para a `EsqueciSenhaScreen`.

#### Scenario: Botão Entrar presente e acionável
- **WHEN** a `SplashScreen` é renderizada
- **THEN** SHALL existir um botão com texto "Entrar", fundo `#F5C142`, borda arredondada (pill), largura total menos margens de 24px
- **WHEN** o usuário toca no botão "Entrar"
- **THEN** o callback `onLogin` SHALL ser chamado

#### Scenario: Botão Criar conta presente e acionável
- **WHEN** a `SplashScreen` é renderizada
- **THEN** SHALL existir um botão com texto "Criar conta", fundo branco, borda `#1A1A2E` de 1.5px, pill shape, mesmas dimensões do botão "Entrar"
- **WHEN** o usuário toca no botão "Criar conta"
- **THEN** o callback `onRegister` SHALL ser chamado

#### Scenario: Link Esqueci minha senha presente
- **WHEN** a `SplashScreen` é renderizada
- **THEN** SHALL existir o texto "Esqueci minha senha" em Inter Regular 13px, cor `#8C8C94`, centralizado abaixo dos botões

#### Scenario: Link Esqueci minha senha navega para recuperação
- **WHEN** o usuário toca em "Esqueci minha senha" na `SplashScreen`
- **THEN** a `EsqueciSenhaScreen` SHALL ser aberta via `Navigator.push`
