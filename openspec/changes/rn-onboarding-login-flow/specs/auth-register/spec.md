## ADDED Requirements

### Requirement: Cadastro multi-step com barra de progresso
O sistema SHALL exibir o fluxo de cadastro em 3 passos com barra de progresso visual no topo (3 segmentos, o atual destacado em `primary`, os demais em `border`).

Passos:
- Passo 1 (05-Cadastro-Step1): "Seus dados" — campos Nome completo + Telefone com máscara
- Passo 2 (06-Cadastro-Step2): "Acesso" — campos Email + Senha + Confirmar senha
- Passo 3 (07-Cadastro-Step3): "Confirmação" — avatar (foto opcional), resumo dos dados

Botão voltar `←` no canto superior esquerdo retorna ao passo anterior ou sai do cadastro.

#### Scenario: Passo 1 com campos válidos avança para passo 2
- **WHEN** usuário preenche Nome e Telefone válidos e toca "Continuar"
- **THEN** passo 2 é exibido e o segundo segmento da barra fica ativo

#### Scenario: Telefone com máscara formata automaticamente
- **WHEN** usuário digita "11999990000" no campo Telefone
- **THEN** o valor exibido é "+55 (11) 99999-0000"

#### Scenario: Passo 1 com nome vazio exibe erro
- **WHEN** usuário toca "Continuar" com campo Nome vazio
- **THEN** mensagem "Nome obrigatório" é exibida e o avanço é bloqueado

---

### Requirement: Validação de senha no passo 2
O sistema SHALL validar que senha e confirmação de senha sejam iguais e que a senha tenha no mínimo 8 caracteres.

#### Scenario: Senhas não correspondem exibem erro
- **WHEN** usuário preenche "Senha" e "Confirmar senha" com valores diferentes
- **THEN** mensagem "As senhas não coincidem" é exibida e avanço é bloqueado

#### Scenario: Senha com menos de 8 caracteres exibe erro
- **WHEN** usuário insere senha com menos de 8 caracteres
- **THEN** mensagem "Senha deve ter no mínimo 8 caracteres" é exibida

#### Scenario: Email duplicado exibe erro na submissão
- **WHEN** API retorna erro 409 (email já cadastrado)
- **THEN** mensagem "Este email já está cadastrado" é exibida no campo Email do passo 2

---

### Requirement: Passo 3 de confirmação com foto opcional
O sistema SHALL exibir avatar circular com iniciais do usuário e opção de "Alterar foto (opcional)" via câmera ou galeria.

#### Scenario: Avatar exibe iniciais por padrão
- **WHEN** passo 3 é exibido sem foto selecionada
- **THEN** o avatar circular exibe as iniciais do nome do usuário (ex: "MV")

#### Scenario: Foto selecionada substitui iniciais
- **WHEN** usuário toca "Alterar foto" e seleciona imagem da galeria
- **THEN** a imagem selecionada é exibida no avatar circular

#### Scenario: Toque em "Criar minha conta" submete dados
- **WHEN** usuário toca "Criar minha conta" no passo 3
- **THEN** dados dos 3 passos são enviados à API e fluxo de OTP é iniciado

---

### Requirement: Verificação OTP de 6 dígitos
O sistema SHALL exibir a tela de OTP (08-OTP do Figma) com 6 campos de dígito individuais, número de telefone parcialmente mascarado no subtítulo, e botão "Reenviar código" com countdown de 30 segundos.

#### Scenario: 6 dígitos preenchidos habilitam botão "Verificar"
- **WHEN** todos os 6 campos OTP são preenchidos
- **THEN** botão "Verificar" fica ativo (sem opacidade reduzida)

#### Scenario: Verificação OTP correta completa cadastro
- **WHEN** usuário insere código correto e toca "Verificar"
- **THEN** conta é criada, token salvo no AsyncStorage e app navega para AppStack

#### Scenario: OTP expirado exibe opção de reenvio
- **WHEN** countdown de 30s chega a zero
- **THEN** link "Reenviar código" fica ativo e ao tocá-lo novo código é enviado e countdown reinicia

#### Scenario: Foco automático avança entre campos OTP
- **WHEN** usuário digita dígito em campo OTP
- **THEN** foco move automaticamente para o próximo campo
