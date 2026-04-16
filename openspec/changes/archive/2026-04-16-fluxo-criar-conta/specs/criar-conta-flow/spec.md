## ADDED Requirements

### Requirement: Step 1 — Dados pessoais
A `CriarContaStep1Screen` SHALL exibir progress bar com 1 de 3 segmentos ativos, título "Criar conta" Inter Bold 26px `#1A1A2E`, subtítulo "Passo 1 de 3 — Seus dados" Inter Regular 14px `#8C8C94`, campos "Nome completo" e "Telefone", e botão "Continuar" fixo no rodapé.

#### Scenario: Renderização do Step 1
- **WHEN** o usuário toca "Criar conta" na `SplashScreen`
- **THEN** a `CriarContaStep1Screen` SHALL ser aberta via `Navigator.push`
- **THEN** SHALL exibir progress bar com segmento 1 amarelo (`#F5C142`) e segmentos 2 e 3 cinza (`#D1D1D1`)
- **THEN** SHALL exibir campo "Nome completo" com placeholder "Seu nome"
- **THEN** SHALL exibir campo "Telefone" com placeholder "+55 (11) 99999-0000" e teclado numérico

#### Scenario: Navegação para Step 2
- **WHEN** o usuário preenche nome e telefone e toca "Continuar"
- **THEN** a `CriarContaStep2Screen` SHALL ser aberta via `Navigator.push` recebendo `nome` e `telefone`

#### Scenario: Botão voltar no Step 1
- **WHEN** o usuário toca ← no Step 1
- **THEN** SHALL retornar à `SplashScreen` via `Navigator.pop`

### Requirement: Step 2 — Dados de acesso
A `CriarContaStep2Screen` SHALL exibir progress bar com 2 de 3 segmentos ativos, subtítulo "Passo 2 de 3 — Acesso", campos "Email", "Senha" e "Confirmar senha", e botão "Continuar".

#### Scenario: Renderização do Step 2
- **WHEN** o usuário chega ao Step 2
- **THEN** SHALL exibir progress bar com segmentos 1 e 2 amarelos, segmento 3 cinza
- **THEN** SHALL exibir campos Email, Senha (obscureText) e Confirmar senha (obscureText)

#### Scenario: Validação de senha
- **WHEN** o usuário toca "Continuar" e Senha ≠ Confirmar senha
- **THEN** SHALL exibir `SnackBar` com mensagem "As senhas não coincidem"
- **THEN** NÃO SHALL navegar para Step 3

#### Scenario: Navegação para Step 3
- **WHEN** email, senha e confirmação preenchidos e senhas iguais, e usuário toca "Continuar"
- **THEN** a `CriarContaStep3Screen` SHALL ser aberta via `Navigator.push` recebendo `nome`, `telefone` e `email`

### Requirement: Step 3 — Confirmação e criação
A `CriarContaStep3Screen` SHALL exibir progress bar completo (3 de 3 ativos), avatar com iniciais, resumo de email e telefone, e botão "Criar minha conta" que chama Firebase Auth.

#### Scenario: Avatar com iniciais
- **WHEN** o Step 3 é renderizado
- **THEN** SHALL exibir círculo 80×80px `AppColors.primary` com as iniciais do nome (primeiras letras das 2 primeiras palavras) em Inter Bold 28px `#1A1A2E`
- **THEN** SHALL exibir texto "Alterar foto (opcional)" em 13px `#8C8C94` abaixo do avatar

#### Scenario: Resumo dos dados
- **WHEN** o Step 3 é renderizado
- **THEN** SHALL exibir "Tudo certo! Revise abaixo:" em Inter SemiBold 16px `#1A1A2E`
- **THEN** SHALL exibir email e telefone no formato "email · telefone" em 13px `#8C8C94`

#### Scenario: Criação de conta bem-sucedida
- **WHEN** o usuário toca "Criar minha conta"
- **THEN** SHALL chamar `FirebaseAuth.instance.createUserWithEmailAndPassword(email, senha)`
- **THEN** em caso de sucesso, SHALL executar `Navigator.popUntil((r) => r.isFirst)` retornando à `SplashScreen`

#### Scenario: Erro na criação de conta
- **WHEN** Firebase retorna erro (email já cadastrado, senha fraca, etc.)
- **THEN** SHALL exibir `SnackBar` com a mensagem de erro do Firebase

### Requirement: Progress bar de 3 segmentos
Cada tela do fluxo SHALL exibir uma progress bar composta por 3 `Container`s de 105×4px com `BorderRadius.circular(2)`, separados por 6px, posicionados abaixo do botão ←. Segmentos ativos: `AppColors.primary`; inativos: `AppColors.inputBorder`.

#### Scenario: Segmentos ativos por passo
- **WHEN** Step 1 é exibido → segmento 1 ativo, 2 e 3 inativos
- **WHEN** Step 2 é exibido → segmentos 1 e 2 ativos, 3 inativo
- **WHEN** Step 3 é exibido → todos os 3 segmentos ativos
