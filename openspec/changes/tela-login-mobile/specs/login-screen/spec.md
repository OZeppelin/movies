## ADDED Requirements

### Requirement: Exibição da tela de Login

A tela de login SHALL ser a tela inicial do app para usuários não autenticados, seguindo o design system: fundo `#0D0D0D`, superfície `#1A1A1A`, acento verde neon `#00E676`, texto primário `#FFFFFF`, texto secundário `#9E9E9E`.

#### Scenario: Acesso de usuário não autenticado
- **WHEN** o usuário abre o app sem sessão ativa
- **THEN** a tela de login é exibida como tela inicial
- **AND** nenhuma tela autenticada (Movie List, Favoritos, Perfil) é acessível

#### Scenario: Acesso de usuário já autenticado
- **WHEN** o usuário abre o app com sessão ativa armazenada
- **THEN** a tela de login é ignorada e o usuário é direcionado à Movie List Screen

---

### Requirement: Header da tela de Login

O header SHALL exibir a identidade visual do app no topo da tela.

#### Scenario: Exibição do logo e título
- **WHEN** o usuário acessa a tela de login
- **THEN** o logo do app é exibido centralizado no topo
- **AND** abaixo do logo é exibido o título "Em Cartaz" em tipografia bold branca
- **AND** abaixo do título é exibido o subtítulo "Filmes & Sessões" em tipografia regular na cor `#9E9E9E`

---

### Requirement: Campo de E-mail

O campo de e-mail SHALL capturar o identificador do usuário para autenticação.

#### Scenario: Exibição do campo de e-mail
- **WHEN** o usuário acessa a tela de login
- **THEN** é exibido um campo de texto com label "E-mail" e placeholder "seu@email.com"
- **AND** o campo possui fundo `#1A1A1A`, borda arredondada (border-radius: 12px) e ícone de envelope à esquerda em `#9E9E9E`
- **AND** o teclado padrão é do tipo `email-address` (sem capitalização automática)

#### Scenario: Campo de e-mail em foco
- **WHEN** o usuário toca no campo de e-mail
- **THEN** a borda do campo muda para `#00E676` (verde neon)
- **AND** o teclado `email-address` é aberto

#### Scenario: E-mail inválido
- **WHEN** o usuário remove o foco do campo com um valor que não é um e-mail válido (sem `@` ou domínio)
- **THEN** uma mensagem de erro é exibida abaixo do campo: "Insira um e-mail válido" em `#FF6B6B`
- **AND** a borda do campo muda para `#FF6B6B`

---

### Requirement: Campo de Senha

O campo de senha SHALL capturar a credencial do usuário de forma segura.

#### Scenario: Exibição do campo de senha
- **WHEN** o usuário acessa a tela de login
- **THEN** é exibido um campo de texto com label "Senha" e placeholder "••••••••"
- **AND** o campo possui fundo `#1A1A1A`, borda arredondada (border-radius: 12px), ícone de cadeado à esquerda em `#9E9E9E` e ícone de olho à direita para alternar visibilidade
- **AND** os caracteres são ocultados por padrão (`secureTextEntry`)

#### Scenario: Alternar visibilidade da senha
- **WHEN** o usuário toca no ícone de olho
- **THEN** os caracteres da senha são exibidos em texto plano
- **AND** o ícone muda para "olho riscado"
- **WHEN** o usuário toca novamente no ícone
- **THEN** os caracteres voltam a ser ocultados

#### Scenario: Campo de senha em foco
- **WHEN** o usuário toca no campo de senha
- **THEN** a borda do campo muda para `#00E676` (verde neon)

#### Scenario: Senha muito curta
- **WHEN** o usuário remove o foco do campo com menos de 6 caracteres
- **THEN** uma mensagem de erro é exibida abaixo do campo: "A senha deve ter no mínimo 6 caracteres" em `#FF6B6B`
- **AND** a borda do campo muda para `#FF6B6B`

---

### Requirement: Botão Entrar

O botão principal SHALL iniciar o fluxo de autenticação com as credenciais fornecidas.

#### Scenario: Botão habilitado
- **WHEN** os campos de e-mail e senha estão preenchidos e sem erros de validação
- **THEN** o botão "Entrar" é exibido com fundo `#00E676`, texto bold `#0D0D0D`, border-radius 14px e largura total
- **AND** o botão responde ao toque

#### Scenario: Botão desabilitado
- **WHEN** qualquer campo está vazio ou com erro de validação
- **THEN** o botão "Entrar" é exibido com opacity 0.4 e não responde ao toque

#### Scenario: Loading durante autenticação
- **WHEN** o usuário toca em "Entrar" com credenciais válidas
- **THEN** o botão exibe um indicador de loading (spinner branco) no lugar do texto
- **AND** os campos de e-mail e senha ficam desabilitados durante a requisição

#### Scenario: Login bem-sucedido
- **WHEN** a API retorna autenticação bem-sucedida
- **THEN** o token de sessão é armazenado de forma segura no dispositivo
- **AND** o usuário é redirecionado para a Movie List Screen com animação de transição

#### Scenario: Credenciais inválidas
- **WHEN** a API retorna erro de credenciais incorretas (401)
- **THEN** o loading é encerrado e os campos ficam habilitados novamente
- **AND** uma mensagem de erro é exibida acima do botão: "E-mail ou senha incorretos. Tente novamente." em `#FF6B6B`
- **AND** o campo de senha é limpo automaticamente

#### Scenario: Erro de conexão
- **WHEN** a requisição falha por falta de conexão ou timeout
- **THEN** o loading é encerrado
- **AND** uma mensagem de erro é exibida: "Sem conexão. Verifique sua internet e tente novamente." em `#FF6B6B`

---

### Requirement: Link de Recuperação de Senha

O link SHALL permitir que o usuário inicie o fluxo de redefinição de senha.

#### Scenario: Exibição do link
- **WHEN** o usuário acessa a tela de login
- **THEN** abaixo do campo de senha é exibido o texto "Esqueci minha senha" alinhado à direita, em cor `#00E676`, tamanho 13pt

#### Scenario: Ação do link
- **WHEN** o usuário toca em "Esqueci minha senha"
- **THEN** o app navega para a tela de recuperação de senha (fora do escopo desta spec)

---

### Requirement: Autenticação com Google (OAuth)

O botão SHALL oferecer autenticação via conta Google como alternativa ao login tradicional.

#### Scenario: Exibição do botão
- **WHEN** o usuário acessa a tela de login
- **THEN** abaixo do botão "Entrar" é exibido um divisor com o texto "ou" centralizado em `#9E9E9E`
- **AND** abaixo do divisor é exibido o botão "Entrar com Google" com fundo `#1A1A1A`, borda `1px solid #2A2A2A`, ícone do Google à esquerda e texto branco

#### Scenario: Fluxo OAuth Google
- **WHEN** o usuário toca em "Entrar com Google"
- **THEN** o fluxo de autenticação OAuth do Google é iniciado (browser/web view nativo)
- **WHEN** o usuário autoriza o acesso
- **THEN** o token é armazenado e o usuário é redirecionado para a Movie List Screen
- **WHEN** o usuário cancela o fluxo OAuth
- **THEN** o usuário retorna à tela de login sem alterações

---

### Requirement: Acessibilidade e Teclado

#### Scenario: Navegação entre campos pelo teclado
- **WHEN** o usuário está no campo de e-mail e toca "Próximo" no teclado
- **THEN** o foco move automaticamente para o campo de senha

#### Scenario: Submissão pelo teclado
- **WHEN** o usuário está no campo de senha e toca "Entrar" no teclado
- **THEN** o formulário é submetido (equivalente a tocar no botão "Entrar")

#### Scenario: Teclado cobre campos
- **WHEN** o teclado é aberto e cobre os campos de input
- **THEN** a tela faz scroll automático para manter o campo ativo visível acima do teclado
