## ADDED Requirements

### Requirement: Fluxo completo de autenticação em 11 telas Figma

O sistema SHALL criar 11 frames no arquivo "movieApp DS — Login Flow" representando o fluxo completo de autenticação, conectados via protótipo navegável, consumindo componentes da Library.

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

#### Scenario: Verificação OTP

- **WHEN** o usuário conclui o Cadastro Step 3
- **THEN** SHALL existir frame `08-OTP` com campo de 6 dígitos, mensagem indicando o canal (SMS/Email) e opção "Reenviar código"

#### Scenario: Tela de Login

- **WHEN** o usuário escolhe "Entrar" no Splash
- **THEN** SHALL existir frame `09-Login` com campos Email e Senha, botão "Entrar" (Primary), link "Esqueci minha senha", e opções de social login (Google, Apple, Facebook)

#### Scenario: Autenticação biométrica

- **WHEN** o usuário tem biometria configurada
- **THEN** SHALL existir frame `10-Biometria` com ícone de fingerprint/face, texto explicativo e opção de fallback para senha

#### Scenario: Recuperação de senha

- **WHEN** o usuário clica em "Esqueci minha senha"
- **THEN** SHALL existir frame `11-Esqueci-Senha` com campo de email, botão "Enviar link" e confirmação visual de envio

#### Scenario: Telas conectadas via protótipo

- **WHEN** o protótipo é executado no Figma
- **THEN** as 11 telas SHALL estar conectadas com flows de navegação: Splash → Onboarding → Cadastro → OTP → Home; Splash → Login → Biometria → Home; Login → Esqueci Senha

#### Scenario: Telas usam componentes da Library

- **WHEN** qualquer tela do Login Flow é inspecionada
- **THEN** botões, inputs e outros elementos SHALL ser instâncias dos componentes da Library, não elementos avulsos
