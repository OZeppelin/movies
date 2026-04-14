## Why

movieApp precisa de uma identidade visual consistente e documentada antes de iniciar o desenvolvimento Flutter. Criar o design system no Figma — com tokens mapeados ao `ThemeData` do Flutter — garante que design e implementação compartilhem a mesma linguagem, evitando retrabalho e inconsistências entre telas.

## What Changes

- Criação de arquivo Figma **"movieApp DS — Library"** contendo:
  - Figma Variables (Foundations) com naming compatível com Flutter `ThemeData`
  - Biblioteca de componentes reutilizáveis (Button, Input, Avatar, Card, Rating, Nav)
- Criação de arquivo Figma **"movieApp DS — Login Flow"** contendo:
  - 11 telas do fluxo completo de autenticação conectadas via protótipo
  - Componentes consumindo tokens da Library
- Exportação de ambos os arquivos via MCP Figma

## Capabilities

### New Capabilities

- `design-tokens`: Foundations do design system — paleta de cores, tipografia, espaçamentos e border radius mapeados para Flutter `ThemeData` como Figma Variables
- `component-library`: Biblioteca de componentes Figma (Button, Input, Avatar, MovieCard, RatingStars, GenreTag, BottomNav) com variants e estados
- `login-flow`: Fluxo completo de autenticação em telas Figma — Splash, Onboarding (×3), Cadastro (×3), OTP, Login, Biometria, Forgot Password

### Modified Capabilities

## Impact

- **Figma**: 2 novos arquivos criados via MCP (`use_figma`, `generate_figma_design`)
- **Flutter**: Tokens nomeados segundo `colorScheme.*`, `textTheme.*`, `ThemeData.*` — prontos para implementação
- **Sem impacto em código existente**: mudança puramente de design/documentação
