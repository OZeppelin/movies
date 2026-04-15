## Context

A tela `01-Splash` do Figma serve como ponto de entrada do app — exibe a identidade visual (logo, nome, tagline) e oferece os dois caminhos de autenticação: login e cadastro. O projeto Flutter já tem a estrutura MVVM e Firebase configurados. O `main.dart` atualmente exibe um `Scaffold` placeholder.

O design usa fundo claro (`#FAFAFA`), paleta restrita (amarelo `#F5C142`, navy `#1A1A2E`, cinza `#8C8C94`) e tipografia Inter. A tela não tem estado dinâmico — é puramente declarativa.

## Goals / Non-Goals

**Goals:**
- Implementar a `SplashScreen` com fidelidade pixel ao design Figma `01-Splash`
- Definir as cores e espaçamentos como constantes reutilizáveis em `lib/core/`
- Registrar a `SplashScreen` como `home` no `MaterialApp`
- Preparar os callbacks de navegação dos botões (sem implementar as rotas de destino ainda)

**Non-Goals:**
- Implementar a lógica de autenticação (login, cadastro, recuperação de senha)
- Criar rotas nomeadas ou sistema de navegação completo
- Adicionar animações de entrada ou transição (pode ser feito em mudança futura)
- Suporte a temas escuros (Dark Mode)

## Decisions

### 1. Widget stateless sem ViewModel

**Decisão**: `SplashScreen` será um `StatelessWidget` simples, sem ViewModel.

**Rationale**: A tela não tem estado gerenciável — é puramente visual com callbacks de navegação. Introduzir um ViewModel seria over-engineering para este caso. O padrão MVVM se aplica quando há lógica de negócio ou estado assíncrono.

### 2. Cores definidas como constantes em `lib/core/app_colors.dart`

**Decisão**: Extrair as cores do design em uma classe `AppColors` com constantes estáticas.

**Rationale**: As cores `#F5C142`, `#1A1A2E` e `#8C8C94` serão usadas em múltiplas telas do fluxo de autenticação. Centralizar evita duplicação e facilita ajustes futuros.

**Alternativa considerada**: Usar `ThemeData` do Flutter — descartado por ser mais complexo para o estágio atual; pode ser migrado depois.

### 3. Layout com `Column` + `Spacer` (não posicionamento absoluto)

**Decisão**: Usar `Column` com `Spacer` para distribuir os elementos verticalmente, em vez de replicar as posições absolutas do Figma.

**Rationale**: O Figma usa coordenadas absolutas para um canvas fixo (375px). Flutter deve usar layout adaptativo para suportar diferentes tamanhos de tela (iPhones, Android). A distribuição com `Spacer` reproduz a intenção visual sem hardcoding de posições.

### 4. Ícone de clapperboard como emoji 🎬

**Decisão**: Usar o emoji 🎬 como ícone dentro do círculo amarelo, conforme o design Figma.

**Rationale**: O design usa o emoji diretamente. Não há asset SVG ou PNG no arquivo Figma — é um Text node com o emoji. Usar `Text('🎬')` é fiel ao design e não requer assets adicionais.

**Alternativa considerada**: Usar `Icons` do Material ou um asset SVG — descartado pois o design usa explicitamente o emoji.

### 5. Botões como `ElevatedButton` e `OutlinedButton`

**Decisão**: Botão "Entrar" usa `ElevatedButton` com `backgroundColor: AppColors.primary`. Botão "Criar conta" usa `OutlinedButton` com `side: BorderSide(color: AppColors.dark)`.

**Rationale**: Mapeia diretamente para os dois estilos do design (filled e outline) usando os widgets idiomáticos do Flutter, sem criar componentes customizados desnecessários neste estágio.

## Risks / Trade-offs

- **Emoji rendering inconsistente entre plataformas** → O emoji 🎬 pode ter aparência ligeiramente diferente no iOS vs Android. Mitigação: aceitável para MVP; pode ser substituído por asset customizado em versão futura.

- **Fonte Inter não disponível por padrão** → Flutter usa a fonte do sistema por padrão. A Inter do Figma pode não corresponder exatamente. Mitigação: adicionar `google_fonts` com `GoogleFonts.inter()` ou aceitar a fonte do sistema (Roboto no Android, SF Pro no iOS) que são visualmente próximas.
