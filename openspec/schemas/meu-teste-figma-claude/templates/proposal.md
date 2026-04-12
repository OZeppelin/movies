## Why

O objetivo é criar um fluxo de navegação mobile para um app de filmes (Movies App) utilizando o design system já existente no Figma como base. O design system fornece componentes prontos com tema escuro, acentos em verde neon e tipografia consistente, acelerando o desenvolvimento e garantindo identidade visual coesa.

A criação deste fluxo serve como estudo prático de integração entre OpenSpec, Figma e Claude — validando o processo de especificação → design → implementação de forma rastreável e colaborativa.

## What Changes

Serão criadas **duas novas telas mobile** no Figma, conectadas em um fluxo de navegação:

### Tela 1 — Movie List (Lista de Filmes)

Tela principal do app, exibindo um grid/lista de filmes em cards verticais ou horizontais. Composta por:

- **Header** com título "Movies" e ícone de busca (lupa)
- **Search Bar** — campo de busca com ícone e placeholder "Search movies..."
- **Filter Chips** — tags horizontais com categorias: All, Action, Drama, Sci-Fi, Horror
- **Movie Card** (componente reutilizável) contendo:
  - Poster do filme (imagem com cantos arredondados)
  - Badge de nota (ex: ★ 8.4) com fundo verde neon
  - Título do filme
  - Gênero + Ano
  - Duração (ex: 2h 28min)
- **Bottom Navigation Bar** com ícones: Home, Search, Favorites, Profile

**Estado de scroll:** lista com pelo menos 6 cards visíveis, indicando scroll vertical.

### Tela 2 — Movie Detail (Detalhe do Filme)

Tela de detalhe exibida ao tocar em um card da lista. Composta por:

- **Hero Image** — backdrop do filme com overlay gradiente escuro (bottom-to-top)
- **Back Button** — ícone de voltar sobre o hero (canto superior esquerdo)
- **Action Buttons flutuantes** — Favoritar (coração) e Compartilhar
- **Seção de Info Principal:**
  - Título do filme (tipografia grande/bold)
  - Rating com estrela verde neon + número
  - Chips de gênero (ex: Sci-Fi · Action · 2h 28min · 2024)
- **Botão CTA "Watch Now"** — botão primário em verde neon, largura total
- **Seção "Overview"** — texto descritivo do enredo (3-4 linhas + "Read more")
- **Seção "Cast"** — scroll horizontal com avatares circulares + nome do ator
- **Seção "More Like This"** — scroll horizontal com mini cards de filmes relacionados

## Capabilities

### New Capabilities

- **Tela de listagem de filmes** com suporte a filtros por categoria e busca
- **Tela de detalhes do filme** com hero visual, informações completas e CTA de ação
- **Componente Movie Card** reutilizável entre as telas (list e more like this)
- **Fluxo de navegação** entre lista → detalhe com transição por tap no card

### Modified Capabilities

- Adaptação dos componentes do design system existente (cards, buttons, chips, bottom nav, avatars) para o contexto de filmes
- Reuso da paleta de cores e tokens tipográficos do design system: fundo `#0D0D0D`, superfície `#1A1A1A`, acento `#00E676` (verde neon), texto primário `#FFFFFF`, texto secundário `#9E9E9E`

## Impact

- **Nenhum impacto em telas existentes** — as duas telas são completamente novas, sem alteração de fluxos anteriores
- **Componente Movie Card** criado como componente Figma reutilizável, podendo ser usado em futuras telas (ex: Favoritos, Resultados de busca)
- O fluxo estabelece o padrão de navegação **List → Detail** que poderá ser replicado para outras entidades (séries, atores, diretores)
- Serve como blueprint para geração de código via Claude com fidelidade 1:1 ao design
