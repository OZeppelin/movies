# Spec — Movie List Screen (Em Cartaz: Filmes & Sessões)

---

## ADDED Requirements

---

### Requirement: Navigation Header

A tela deve exibir um header fixo no topo com o título da seção e uma barra de busca integrada, seguindo o design system (fundo `#0D0D0D`, texto branco, acento verde neon `#00E676`).

#### Scenario: Exibição do título da navegação
- **WHEN** o usuário acessa a tela de lista de filmes
- **THEN** o header exibe o título "EM CARTAZ Filmes & Sessões" em tipografia bold, centralizado ou alinhado à esquerda, com cor `#FFFFFF`

#### Scenario: Exibição da SearchBar
- **WHEN** o usuário acessa a tela de lista de filmes
- **THEN** abaixo do título é exibida uma SearchBar com:
  - Ícone de lupa à esquerda (`#9E9E9E`)
  - Placeholder "Buscar filmes..." com cor `#9E9E9E`
  - Fundo do campo `#1A1A1A` com borda arredondada (border-radius: 12px)
  - Cursor de texto em verde neon `#00E676` ao focar

#### Scenario: Interação com a SearchBar
- **WHEN** o usuário toca na SearchBar
- **THEN** o teclado é aberto e o placeholder desaparece
- **AND** um botão "Cancelar" aparece à direita da SearchBar
- **WHEN** o usuário pressiona "Cancelar"
- **THEN** a busca é limpa, o teclado é fechado e a lista original é restaurada

---

### Requirement: Movie List com Scroll Infinito

A lista de filmes deve ser renderizada em scroll vertical infinito, otimizada para mobile, carregando novos itens conforme o usuário rola a tela.

#### Scenario: Carregamento inicial da lista
- **WHEN** o usuário acessa a tela pela primeira vez
- **THEN** são exibidos os primeiros 10 filmes em cartaz
- **AND** cada item da lista é renderizado como uma célula (card) seguindo o layout definido

#### Scenario: Scroll infinito — carregamento de mais itens
- **WHEN** o usuário rola a lista e atinge os últimos 2 itens visíveis
- **THEN** um indicador de loading é exibido no rodapé da lista (spinner verde neon `#00E676`)
- **AND** os próximos 10 filmes são carregados e anexados ao final da lista

#### Scenario: Scroll infinito — fim da lista
- **WHEN** não há mais filmes a carregar
- **THEN** o spinner de loading não é exibido
- **AND** uma mensagem sutil "Todos os filmes foram carregados" é exibida no rodapé

#### Scenario: Scroll infinito — falha no carregamento
- **WHEN** a requisição de mais itens falha (erro de rede ou servidor)
- **THEN** o spinner é substituído por uma mensagem de erro inline "Falha ao carregar. Tentar novamente"
- **AND** o texto "Tentar novamente" é clicável e dispara nova requisição

---

### Requirement: Movie Cell (Célula da Lista)

Cada item da lista deve ser um card horizontal com fundo `#1A1A1A`, cantos arredondados (border-radius: 16px) e sombra sutil. A célula contém os seguintes campos obrigatórios:

#### Campos da célula:

| Campo             | Descrição                                                                 |
|-------------------|---------------------------------------------------------------------------|
| Thumb do cartaz   | Imagem vertical do poster do filme (proporção 2:3), cantos arredondados (8px), alinhada à esquerda |
| Título do filme   | Texto bold, cor `#FFFFFF`, máximo 2 linhas com truncamento (`...`)         |
| Data              | Data de estreia ou exibição no formato `DD MMM YYYY` (ex: 12 Abr 2026)   |
| Local             | Nome do cinema/sala de exibição, ícone de localização (`#9E9E9E`) à esquerda |
| Próximas sessões  | Exibição dos horários das próximas 2 sessões em chips (ex: `14:30` `17:00`) |

#### Scenario: Exibição completa da célula
- **WHEN** o filme possui todos os dados disponíveis (poster, título, data, local, sessões)
- **THEN** a célula exibe todos os campos preenchidos conforme o layout definido
- **AND** os chips de sessão têm fundo `#00E676` com texto `#0D0D0D` (verde neon com texto escuro)

#### Scenario: Thumb do cartaz — imagem indisponível
- **WHEN** a URL do poster está ausente ou falha ao carregar
- **THEN** um placeholder é exibido no lugar da imagem com ícone de filme centralizado e fundo `#2A2A2A`

#### Scenario: Título longo
- **WHEN** o título do filme excede 2 linhas no espaço disponível
- **THEN** o texto é truncado com `...` ao final da segunda linha
- **AND** o layout da célula não é quebrado

#### Scenario: Apenas 1 sessão disponível
- **WHEN** o filme possui somente 1 sessão futura disponível
- **THEN** apenas 1 chip de horário é exibido
- **AND** nenhum chip placeholder é inserido no lugar do segundo

#### Scenario: Nenhuma sessão disponível
- **WHEN** o filme não possui sessões futuras cadastradas
- **THEN** a área de sessões exibe o texto "Sem sessões disponíveis" em cor `#9E9E9E`

#### Scenario: Tap na célula
- **WHEN** o usuário toca em qualquer área da célula do filme
- **THEN** o app navega para a tela de detalhe do filme (Movie Detail)
- **AND** a célula exibe feedback visual de toque (opacidade reduzida ou highlight sutil)

---

### Requirement: Estado de Lista Vazia

#### Scenario: Nenhum filme em cartaz
- **WHEN** a API retorna lista vazia e não há busca ativa
- **THEN** é exibida uma ilustração centralizada com ícone de reel de filme
- **AND** o texto "Nenhum filme em cartaz no momento" é exibido em `#9E9E9E`

#### Scenario: Busca sem resultados
- **WHEN** o usuário pesquisa um termo que não corresponde a nenhum filme
- **THEN** é exibida uma ilustração de busca vazia
- **AND** o texto "Nenhum resultado para "[termo buscado]"" é exibido em `#9E9E9E`

---

### Requirement: Estado de Erro no Carregamento Inicial

#### Scenario: Falha ao carregar a lista inicial
- **WHEN** a requisição inicial falha (sem conexão ou erro do servidor)
- **THEN** a lista não é exibida
- **AND** uma tela de erro é exibida com ícone de alerta, mensagem "Não foi possível carregar os filmes" e botão "Tentar novamente" em verde neon `#00E676`
- **WHEN** o usuário pressiona "Tentar novamente"
- **THEN** uma nova requisição é disparada e o indicador de loading é exibido

---

### Requirement: Loading State Inicial

#### Scenario: Carregamento da lista em andamento
- **WHEN** a requisição inicial ainda não foi concluída
- **THEN** são exibidos skeletons das células no lugar da lista real
- **AND** os skeletons seguem o mesmo layout da célula (thumb + linhas de texto) com animação de shimmer em tons de `#2A2A2A` → `#3A3A3A`
