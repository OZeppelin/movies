# Component Library

## Purpose

Define and build the Figma component library ("movieApp DS — Library") with all UI components using Auto Layout, variants following the `Type / State / Size` naming pattern, and consuming design tokens from Figma Variables — ensuring a single source of truth for all app screens.

## Requirements

### Requirement: Componentes Figma com variants e estados

O sistema SHALL criar componentes no arquivo "movieApp DS — Library" usando Auto Layout, com variants nomeadas no padrão `Type / State / Size`, consumindo tokens da coleção de Figma Variables.

#### Scenario: Button com todas as variants

- **WHEN** o componente Button é criado
- **THEN** SHALL ter variants de Type: `Primary`, `Secondary`, `Ghost`, `Social`
- **THEN** SHALL ter variants de State: `Default`, `Pressed`, `Disabled`, `Loading`
- **THEN** SHALL ter variants de Size: `SM`, `MD`, `LG`
- **THEN** Button Primary SHALL usar `colorScheme/primary` como background e `colorScheme/onPrimary` como texto

#### Scenario: Input com estados de validação

- **WHEN** o componente Input é criado
- **THEN** SHALL ter variants de State: `Default`, `Focus`, `Filled`, `Error`
- **THEN** SHALL ter variants de Type: `Text`, `Password`, `Phone`
- **THEN** Input no estado Error SHALL exibir mensagem de erro abaixo do campo usando `colorScheme/error`

#### Scenario: Componentes de conteúdo do app

- **WHEN** os componentes de domínio são criados
- **THEN** SHALL existir `MovieCard` com poster, título, gênero e rating
- **THEN** SHALL existir `RatingStars` com variants de 1 a 5 estrelas, cor `colorScheme/primary`
- **THEN** SHALL existir `GenreTag` (Badge adaptado) para categorias de filmes
- **THEN** SHALL existir `Avatar` com sizes: SM (32px), MD (48px), LG (80px)
- **THEN** SHALL existir `BottomNav` com 4 itens: Home, Search, Watchlist, Profile

#### Scenario: Componentes usam tokens, não cores hardcoded

- **WHEN** qualquer componente é inspecionado no Figma
- **THEN** todas as propriedades de cor SHALL referenciar Figma Variables da Library, não valores hexadecimais diretos
