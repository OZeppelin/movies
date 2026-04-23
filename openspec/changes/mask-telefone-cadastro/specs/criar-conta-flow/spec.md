## MODIFIED Requirements

### Requirement: Step 1 — Dados pessoais
A `CriarContaStep1Screen` SHALL exibir progress bar com 1 de 3 segmentos ativos, título "Criar conta" Inter Bold 26px `#1A1A2E`, subtítulo "Passo 1 de 3 — Seus dados" Inter Regular 14px `#8C8C94`, campos "Nome completo" e "Telefone", e botão "Continuar" fixo no rodapé. O campo "Telefone" SHALL aplicar máscara `(XX) XXXXX-XXXX` durante a digitação e enviar somente os dígitos ao ViewModel ao avançar.

#### Scenario: Renderização do Step 1
- **WHEN** o usuário toca "Criar conta" na `SplashScreen`
- **THEN** a `CriarContaStep1Screen` SHALL ser aberta via `Navigator.push`
- **THEN** SHALL exibir progress bar com segmento 1 amarelo (`#F5C142`) e segmentos 2 e 3 cinza (`#D1D1D1`)
- **THEN** SHALL exibir campo "Nome completo" com placeholder "Seu nome"
- **THEN** SHALL exibir campo "Telefone" com placeholder `(11) 99999-0000` e teclado numérico

#### Scenario: Máscara aplicada durante digitação
- **WHEN** o usuário digita dígitos no campo "Telefone"
- **THEN** o valor exibido SHALL seguir o formato `(XX) XXXXX-XXXX` (celular) ou `(XX) XXXX-XXXX` (fixo)

#### Scenario: Dígitos puros enviados ao ViewModel
- **WHEN** o usuário preenche nome e telefone e toca "Continuar"
- **THEN** `viewModel.saveStep1` SHALL receber o telefone como string contendo apenas dígitos (sem parênteses, espaços ou traços)
- **THEN** a `CriarContaStep2Screen` SHALL ser aberta via `Navigator.push`

#### Scenario: Navegação para Step 2
- **WHEN** o usuário preenche nome e telefone e toca "Continuar"
- **THEN** a `CriarContaStep2Screen` SHALL ser aberta via `Navigator.push` recebendo `nome` e `telefone`

#### Scenario: Botão voltar no Step 1
- **WHEN** o usuário toca ← no Step 1
- **THEN** SHALL retornar à `SplashScreen` via `Navigator.pop`
