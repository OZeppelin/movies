## 1. Preparação e acesso ao Figma

- [x] 1.1 Verificar conexão MCP Figma (`whoami`) e confirmar conta ativa
- [x] 1.2 Criar arquivo "movieApp DS — Library" no Figma via MCP
- [x] 1.3 Criar arquivo "movieApp DS — Login Flow" no Figma via MCP
- [x] 1.4 Anotar os `fileKey` de ambos os arquivos para uso nas tarefas seguintes

## 2. Foundations — Figma Variables (Arquivo Library)

- [x] 2.1 Criar coleção "colorScheme" com tokens: `primary`, `onPrimary`, `surface`, `onSurface`, `error`, `onError`, `background`, `onBackground`
- [x] 2.2 Criar coleção "textTheme" com tokens de tipografia: `titleLarge`, `titleMedium`, `bodyMedium`, `bodySmall`, `labelSmall`
- [x] 2.3 Criar coleção "spacing" com escala 4pt: `xs` a `5xl`
- [x] 2.4 Criar coleção "borderRadius" com valores: `sm`, `md`, `lg`, `pill`
- [x] 2.5 Validar screenshot da página Foundations via `get_screenshot`

## 3. Component Library — Arquivo Library

- [x] 3.1 Criar componente `Button` com variants Type (Primary/Secondary/Ghost/Social) × State (Default/Pressed/Disabled/Loading) × Size (SM/MD/LG)
- [x] 3.2 Criar componente `Input` com variants Type (Text/Password/Phone) × State (Default/Focus/Filled/Error)
- [x] 3.3 Criar componente `Avatar` com sizes SM (32px), MD (48px), LG (80px)
- [x] 3.4 Criar componente `RatingStars` com variants de 1 a 5 estrelas
- [x] 3.5 Criar componente `GenreTag` (Badge) para categorias de filmes
- [x] 3.6 Criar componente `MovieCard` com poster, título, gênero e rating
- [x] 3.7 Criar componente `BottomNav` com 4 itens: Home, Search, Watchlist, Profile
- [x] 3.8 Validar que todos os componentes referenciam Figma Variables (sem hardcode de cores)
- [ ] 3.9 Publicar a Library no Figma para permitir consumo pelo arquivo Login Flow (ação manual no Figma UI)

## 4. Login Flow — Telas (Arquivo Login Flow)

- [x] 4.1 Criar frame `01-Splash` com logo movieApp, ícone de filme e CTAs "Entrar" / "Criar conta"
- [x] 4.2 Criar frames `02-Onboarding-1`, `03-Onboarding-2`, `04-Onboarding-3` com ilustração, título, subtítulo e dots de progresso
- [x] 4.3 Criar frame `05-Cadastro-Step1` com campos Nome e Telefone, indicador "Passo 1 de 3"
- [x] 4.4 Criar frame `06-Cadastro-Step2` com campos Email e Senha, indicador "Passo 2 de 3"
- [x] 4.5 Criar frame `07-Cadastro-Step3` com confirmação e opção de avatar, indicador "Passo 3 de 3"
- [x] 4.6 Criar frame `08-OTP` com campo de 6 dígitos, mensagem de canal e link "Reenviar código"
- [x] 4.7 Criar frame `09-Login` com campos Email/Senha, link "Esqueci minha senha" e social login (Google, Apple, Facebook)
- [x] 4.8 Criar frame `10-Biometria` com ícone fingerprint/face, texto explicativo e fallback para senha
- [x] 4.9 Criar frame `11-Esqueci-Senha` com campo email, botão "Enviar link" e confirmação de envio
- [x] 4.10 Validar screenshots de cada tela via `get_screenshot`

## 5. Protótipo e conexões

- [x] 5.1 Conectar fluxo: Splash → Onboarding 1 → 2 → 3 → Cadastro Step 1 → 2 → 3 → OTP
- [x] 5.2 Conectar fluxo: Splash → Login → Biometria
- [x] 5.3 Conectar fluxo: Login → Esqueci Senha
- [x] 5.4 Validar que todas as telas do Login Flow usam componentes da Library (não elementos avulsos)

## 6. Revisão final

- [x] 6.1 Verificar consistência visual entre as 11 telas (espaçamentos, tipografia, cores)
- [x] 6.2 Confirmar que nenhum token está hardcoded nas telas (inspecionar via MCP)
- [x] 6.3 Compartilhar links dos dois arquivos Figma com o time
