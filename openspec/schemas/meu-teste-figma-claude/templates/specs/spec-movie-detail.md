# Spec — Movie Detail Screen (Detalhe do Filme)

> Tela acessada a partir do tap em qualquer célula da Movie List Screen (spec.md).
> Segue o mesmo design system: fundo `#0D0D0D`, superfície `#1A1A1A`, acento verde neon `#00E676`, texto primário `#FFFFFF`, texto secundário `#9E9E9E`.

---

## ADDED Requirements

---

### Requirement: Navigation Header

O header da tela de detalhe é fixo no topo, com fundo transparente sobreposto ao cartaz do filme durante o scroll inicial, tornando-se opaco (`#0D0D0D`) ao rolar a tela para cima.

#### Cenários da Navigation:

#### Scenario: Botão Voltar (esquerda)
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** o canto esquerdo do header exibe um botão de voltar com ícone de chevron/seta (`←`) em cor `#FFFFFF`
- **AND** o botão possui área de toque mínima de 44x44pt
- **WHEN** o usuário toca no botão de voltar
- **THEN** o app navega de volta para a Movie List Screen mantendo a posição de scroll da lista

#### Scenario: Botão Curtir (direita)
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** o canto direito do header exibe o ícone de coração (`♡`) em cor `#FFFFFF` (estado não curtido)
- **WHEN** o usuário toca no botão de curtir
- **THEN** o ícone muda para coração preenchido (`♥`) em cor `#00E676` (verde neon)
- **AND** uma animação de pulse/scale ocorre no ícone (duração: ~200ms)
- **WHEN** o usuário toca novamente no botão de curtir
- **THEN** o ícone retorna ao estado não curtido (`♡`) em `#FFFFFF`

#### Scenario: Botão Compartilhar (direita, ao lado do curtir)
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** à esquerda do botão de curtir é exibido um ícone de compartilhar (upload/share) em cor `#FFFFFF`
- **WHEN** o usuário toca no botão de compartilhar
- **THEN** o share sheet nativo do sistema operacional é aberto
- **AND** o conteúdo compartilhado inclui o título do filme, local, horários e um deep link para a tela de detalhe

#### Scenario: Header transparente → opaco no scroll
- **WHEN** o usuário está no topo da tela (scroll = 0)
- **THEN** o fundo do header é totalmente transparente, exibindo o cartaz atrás
- **WHEN** o usuário rola a tela para cima além de 80pt
- **THEN** o fundo do header transita gradualmente para `#0D0D0D` com animação de fade
- **AND** o título do filme aparece no centro do header com tipografia medium branca

---

### Requirement: Cartaz do Filme (Hero Image)

#### Scenario: Exibição do cartaz
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** o cartaz do filme é exibido no topo da tela ocupando 100% da largura e aproximadamente 55% da altura da viewport
- **AND** sobre o cartaz há um gradiente overlay de baixo para cima: de `#0D0D0D` (100% opaco) até transparente, garantindo legibilidade do conteúdo abaixo

#### Scenario: Imagem do cartaz indisponível
- **WHEN** a URL do cartaz está ausente ou falha ao carregar
- **THEN** um placeholder é exibido com fundo `#1A1A1A` e ícone de filme centralizado em `#9E9E9E`
- **AND** o layout da tela não é afetado

#### Scenario: Loading do cartaz
- **WHEN** a imagem do cartaz ainda está sendo carregada
- **THEN** um shimmer animation é exibido na área do cartaz (tons `#2A2A2A` → `#3A3A3A`)
- **WHEN** a imagem carrega
- **THEN** ela aparece com uma animação de fade-in suave (duração: ~300ms)

---

### Requirement: Título do Filme

#### Scenario: Exibição do título
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** o título do filme é exibido logo abaixo da área do cartaz
- **AND** a tipografia é bold, tamanho grande (24-28pt), cor `#FFFFFF`
- **AND** o título exibe até 3 linhas; se exceder, é truncado com `...`

#### Scenario: Título longo
- **WHEN** o título do filme possui mais de 3 linhas no tamanho de fonte padrão
- **THEN** o texto é truncado com `...` ao final da terceira linha
- **AND** o layout das seções abaixo não é deslocado

---

### Requirement: Local de Exibição

#### Scenario: Exibição do local
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** abaixo do título é exibida uma linha com ícone de localização (`📍`) em `#00E676` seguido do nome do cinema/sala em `#9E9E9E`
- **AND** o nome do local é exibido em uma única linha com truncamento se necessário

#### Scenario: Local indisponível
- **WHEN** o dado de local não está disponível
- **THEN** a linha de local não é renderizada
- **AND** nenhum espaço em branco residual é deixado no layout

---

### Requirement: Horários das Sessões

#### Scenario: Exibição das sessões disponíveis
- **WHEN** o filme possui sessões futuras cadastradas
- **THEN** é exibida uma seção com título "Sessões" em `#FFFFFF` bold
- **AND** cada sessão é representada por um chip com:
  - Horário em formato `HH:MM` (ex: `14:30`)
  - Fundo `#1A1A1A` com borda `1px solid #00E676`
  - Texto `#00E676`
  - Border-radius: 8px
  - Padding: 8px 16px
- **AND** os chips são dispostos em scroll horizontal ou wrap (máx. 2 colunas)

#### Scenario: Sessão selecionada pelo usuário
- **WHEN** o usuário toca em um chip de horário
- **THEN** o chip selecionado muda para fundo `#00E676` com texto `#0D0D0D`
- **AND** os demais chips retornam ao estado padrão (borda verde, fundo escuro)
- **AND** o estado selecionado persiste até o usuário selecionar outro chip ou sair da tela

#### Scenario: Nenhuma sessão disponível
- **WHEN** o filme não possui sessões futuras cadastradas
- **THEN** a seção de sessões exibe o texto "Sem sessões disponíveis" em `#9E9E9E`
- **AND** o botão "Comprar Ingresso" no rodapé fica desabilitado (opacity: 0.4, não interativo)

---

### Requirement: Sinopse do Filme

#### Scenario: Exibição da sinopse
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** é exibida uma seção com título "Sinopse" em `#FFFFFF` bold
- **AND** o texto da sinopse é exibido em cor `#9E9E9E`, tamanho regular (14-16pt), limitado a 4 linhas

#### Scenario: Sinopse expandível
- **WHEN** a sinopse possui mais de 4 linhas
- **THEN** o texto é truncado após a 4ª linha
- **AND** um botão "Ver mais" é exibido em `#00E676` logo abaixo do texto truncado
- **WHEN** o usuário toca em "Ver mais"
- **THEN** a sinopse completa é exibida sem truncamento
- **AND** o botão muda para "Ver menos"
- **WHEN** o usuário toca em "Ver menos"
- **THEN** a sinopse retorna ao estado truncado de 4 linhas

#### Scenario: Sinopse indisponível
- **WHEN** o dado de sinopse não está disponível
- **THEN** a seção exibe o texto "Sinopse não disponível" em `#9E9E9E` (itálico)

---

### Requirement: Tempo de Exibição do Filme

#### Scenario: Exibição da duração
- **WHEN** o usuário acessa a tela de detalhe
- **THEN** é exibida uma linha de metadados contendo ícone de relógio (`🕐`) em `#9E9E9E` seguido da duração no formato `Xh YYmin` (ex: `2h 28min`)
- **AND** este metadado fica visível na área de informações abaixo do título, ao lado ou abaixo do local

#### Scenario: Duração indisponível
- **WHEN** o dado de duração não está disponível
- **THEN** o campo de duração não é renderizado
- **AND** nenhum espaço em branco residual é deixado no layout

---

### Requirement: Botão de Compra no Rodapé

O botão "Comprar Ingresso" fica fixo no rodapé da tela, sempre visível independentemente do scroll, com safe area respeitada (iPhone notch/home indicator).

#### Scenario: Exibição do botão habilitado
- **WHEN** o usuário acessa a tela e há pelo menos uma sessão disponível
- **THEN** o rodapé exibe o botão "Comprar Ingresso" com:
  - Largura total (com margens horizontais de 16pt)
  - Fundo `#00E676` (verde neon)
  - Texto "Comprar Ingresso" em bold, cor `#0D0D0D`
  - Border-radius: 14px
  - Altura mínima: 52pt

#### Scenario: Botão habilitado sem sessão selecionada
- **WHEN** nenhuma sessão foi selecionada pelo usuário
- **THEN** o botão permanece habilitado e interativo
- **WHEN** o usuário toca no botão sem sessão selecionada
- **THEN** uma mensagem de alerta inline é exibida acima do botão: "Selecione um horário para continuar" em `#FF6B6B` (vermelho de atenção)
- **AND** a seção de sessões faz um scroll automático até ficar visível na tela

#### Scenario: Botão habilitado com sessão selecionada
- **WHEN** o usuário selecionou um horário de sessão
- **THEN** o label do botão exibe "Comprar Ingresso — HH:MM" (ex: "Comprar Ingresso — 14:30")
- **WHEN** o usuário toca no botão
- **THEN** o app navega para o fluxo de compra de ingresso passando o id do filme e o horário selecionado

#### Scenario: Botão desabilitado (sem sessões)
- **WHEN** o filme não possui sessões disponíveis
- **THEN** o botão é exibido com opacity 0.4 e não responde ao toque
- **AND** o label exibe "Sem sessões disponíveis"

---

### Requirement: Loading State da Tela de Detalhe

#### Scenario: Carregamento inicial dos dados
- **WHEN** o usuário navega para a tela de detalhe e os dados ainda estão sendo carregados
- **THEN** a área do cartaz exibe shimmer animation (`#2A2A2A` → `#3A3A3A`)
- **AND** as seções de título, local, sessões e sinopse exibem linhas de skeleton com a mesma animação
- **AND** o botão do rodapé fica desabilitado durante o loading (opacity: 0.4)

---

### Requirement: Estado de Erro na Tela de Detalhe

#### Scenario: Falha ao carregar dados do filme
- **WHEN** a requisição de dados do filme falha (sem conexão ou erro do servidor)
- **THEN** a tela exibe uma mensagem de erro centralizada com ícone de alerta
- **AND** o texto "Não foi possível carregar os detalhes do filme" é exibido em `#9E9E9E`
- **AND** um botão "Tentar novamente" em `#00E676` é exibido abaixo da mensagem
- **WHEN** o usuário toca em "Tentar novamente"
- **THEN** uma nova requisição é disparada e o loading state é exibido
