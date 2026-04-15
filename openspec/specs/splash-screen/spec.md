# Spec: Splash Screen

## Purpose

TBD — Definir os requisitos visuais e funcionais da tela de abertura (Splash Screen) do movieApp, incluindo identidade visual, CTAs de autenticação e centralização das cores do design system.

## Requirements

### Requirement: Tela Splash exibe identidade visual do app
A `SplashScreen` SHALL exibir o logo circular (fundo `#F5C142`, ícone 🎬), o nome "movieApp" em Inter Bold 32px (`#1A1A2E`), e a tagline "Seu cinema na palma da mão" em Inter Regular 16px (`#8C8C94`), sobre fundo `#FAFAFA`, conforme o design Figma `01-Splash`.

#### Scenario: Elementos visuais presentes na tela
- **WHEN** a `SplashScreen` é renderizada
- **THEN** SHALL exibir um círculo com fundo `#F5C142` contendo o ícone 🎬
- **THEN** SHALL exibir o texto "movieApp" centralizado abaixo do logo
- **THEN** SHALL exibir o texto "Seu cinema na palma da mão" centralizado abaixo do nome

#### Scenario: Fundo da tela
- **WHEN** a `SplashScreen` é renderizada
- **THEN** o fundo da tela SHALL ter a cor `#FAFAFA`

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

### Requirement: Cores do app centralizadas em AppColors
O projeto SHALL ter uma classe `AppColors` em `lib/core/app_colors.dart` com as constantes de cor definidas pelo design system do movieApp.

#### Scenario: Constantes de cor disponíveis
- **WHEN** qualquer widget do app referencia uma cor do design
- **THEN** SHALL usar constantes de `AppColors` em vez de valores hexadecimais inline
- **THEN** SHALL existir ao menos `AppColors.background` (`#FAFAFA`), `AppColors.primary` (`#F5C142`), `AppColors.dark` (`#1A1A2E`) e `AppColors.textSecondary` (`#8C8C94`)
