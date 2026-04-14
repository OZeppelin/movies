## 1. Preparação e acesso ao Figma

- [ ] 1.1 Verificar conexão MCP Figma (`whoami`) e confirmar conta ativa
- [ ] 1.2 Criar arquivo "movieApp DS — Library" no Figma via MCP
- [ ] 1.3 Criar arquivo "movieApp DS — Login Flow" no Figma via MCP
- [ ] 1.4 Anotar os `fileKey` de ambos os arquivos para uso nas tarefas seguintes

## 2. Foundations — Figma Variables (Arquivo Library)

- [ ] 2.1 Criar coleção "colorScheme" com tokens: `primary`, `onPrimary`, `surface`, `onSurface`, `error`, `onError`, `background`, `onBackground`
- [ ] 2.2 Criar coleção "textTheme" com tokens de tipografia: `titleLarge`, `titleMedium`, `bodyMedium`, `bodySmall`, `labelSmall`
- [ ] 2.3 Criar coleção "spacing" com escala 4pt: `xs` a `5xl`
- [ ] 2.4 Criar coleção "borderRadius" com valores: `sm`, `md`, `lg`, `pill`
- [ ] 2.5 Validar screenshot da página Foundations via `get_screenshot`

## 3. Component Library — Arquivo Library

- [ ] 3.1 Criar componente `Button` com variants Type (Primary/Secondary/Ghost/Social) × State (Default/Pressed/Disabled/Loading) × Size (SM/MD/LG)
- [ ] 3.2 Criar componente `Input` com variants Type (Text/Password/Phone) × State (Default/Focus/Filled/Error)
- [ ] 3.3 Criar componente `Avatar` com sizes SM (32px), MD (48px), LG (80px)
- [ ] 3.4 Criar componente `RatingStars` com variants de 1 a 5 estrelas
- [ ] 3.5 Criar componente `GenreTag` (Badge) para categorias de filmes
- [ ] 3.6 Criar componente `MovieCard` com poster, título, gênero e rating
- [ ] 3.7 Criar componente `BottomNav` com 4 itens: Home, Search, Watchlist, Profile
- [ ] 3.8 Validar que todos os componentes referenciam Figma Variables (sem hardcode de cores)
- [ ] 3.9 Publicar a Library no Figma para permitir consumo pelo arquivo Login Flow

## 4. Login Flow — Telas (Arquivo Login Flow)

- [ ] 4.1 Criar frame `01-Splash` com logo movieApp, ícone de filme e CTAs "Entrar" / "Criar conta"
- [ ] 4.2 Criar frames `02-Onboarding-1`, `03-Onboarding-2`, `04-Onboarding-3` com ilustração, título, subtítulo e dots de progresso
- [ ] 4.3 Criar frame `05-Cadastro-Step1` com campos Nome e Telefone, indicador "Passo 1 de 3"
- [ ] 4.4 Criar frame `06-Cadastro-Step2` com campos Email e Senha, indicador "Passo 2 de 3"
- [ ] 4.5 Criar frame `07-Cadastro-Step3` com confirmação e opção de avatar, indicador "Passo 3 de 3"
- [ ] 4.6 Criar frame `08-OTP` com campo de 6 dígitos, mensagem de canal e link "Reenviar código"
- [ ] 4.7 Criar frame `09-Login` com campos Email/Senha, link "Esqueci minha senha" e social login (Google, Apple, Facebook)
- [ ] 4.8 Criar frame `10-Biometria` com ícone fingerprint/face, texto explicativo e fallback para senha
- [ ] 4.9 Criar frame `11-Esqueci-Senha` com campo email, botão "Enviar link" e confirmação de envio
- [ ] 4.10 Validar screenshots de cada tela via `get_screenshot`

## 5. Protótipo e conexões

- [ ] 5.1 Conectar fluxo: Splash → Onboarding 1 → 2 → 3 → Cadastro Step 1 → 2 → 3 → OTP
- [ ] 5.2 Conectar fluxo: Splash → Login → Biometria
- [ ] 5.3 Conectar fluxo: Login → Esqueci Senha
- [ ] 5.4 Validar que todas as telas do Login Flow usam componentes da Library (não elementos avulsos)

## 6. Revisão final

- [ ] 6.1 Verificar consistência visual entre as 11 telas (espaçamentos, tipografia, cores)
- [ ] 6.2 Confirmar que nenhum token está hardcoded nas telas (inspecionar via MCP)
- [ ] 6.3 Compartilhar links dos dois arquivos Figma com o time
