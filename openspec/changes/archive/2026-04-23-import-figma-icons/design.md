## Context

O design system do movieApp usa emojis como ícones visuais. Para importá-los como assets PNG no Flutter, os arquivos precisam existir fisicamente em `assets/icons/` e ser declarados no `pubspec.yaml`. A classe `AppIcons` passa a centralizar os caminhos de asset em vez de strings emoji brutas.

Fonte dos PNGs: emojis do Google Noto Emoji (licença OFL/Apache 2.0, open-source), que é o conjunto padrão usado no Android e disponível em https://github.com/googlefonts/noto-emoji. Os arquivos PNG serão baixados manualmente para `assets/icons/`.

## Goals / Non-Goals

**Goals:**
- Diretório `assets/icons/` com um PNG por ícone identificado no Figma
- `pubspec.yaml` declara `assets/icons/` como asset path
- `lib/core/app_icons.dart` com `AppIcons` expondo constantes `static const String` dos caminhos de asset (ex: `'assets/icons/app.png'`)

**Non-Goals:**
- Geração automática ou script de download dos PNGs
- SVG — Flutter core não suporta SVG nativo; PNG é o formato adequado
- Refatorar widgets existentes para usar `Image.asset(AppIcons.x)` (pós-escopo)

## Decisions

**Google Noto Emoji como fonte dos PNGs**
Licença permissiva, cobertura completa dos emojis usados no projeto, resolução adequada para mobile (72px/128px disponíveis). Alternativa (Apple Emoji) tem restrições de licença.

**`static const String` com caminho de asset**
Consistente com a convenção já definida. Widgets usam `Image.asset(AppIcons.app)` — sem mudança de tipo.

**Diretório plano `assets/icons/`**
Um diretório para todos os ícones do projeto — sem subpastas por categoria neste momento. Simples de declarar no pubspec com uma única entrada.

## Risks / Trade-offs

**Download manual dos PNGs** → Aceitável para a escala atual. Automação pode ser adicionada futuramente via script.

**Tamanho do bundle** → PNGs de emoji são pequenos (~5–15 KB cada). Impacto negligenciável para 6 arquivos.
