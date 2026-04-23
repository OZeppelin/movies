## Context

`AppIcons` centraliza os caminhos de asset PNG em `lib/core/app_icons.dart`. As telas ainda usam strings de emoji inline. A mudança consiste em substituir cada ocorrência pelo valor correspondente de `AppIcons` e, onde o emoji era renderizado como `Text`, mudar para `Image.asset`.

Caso especial: `onboarding_screen.dart` passa o emoji como parâmetro `String emoji` para `_SlideData` e `_OnboardingSlide`, que renderiza via `Text(emoji, style: TextStyle(fontSize: 80))`. O campo precisa receber o asset path e o widget precisa renderizar via `Image.asset`.

## Goals / Non-Goals

**Goals:**
- Todos os emojis PNG (🎬, ⭐, 🍿, ✉) renderizados via `Image.asset(AppIcons.x)`
- Todos os `←` hardcoded substituídos por `Text(AppIcons.back)`
- `_OnboardingSlide` aceita asset path no campo `emoji` e renderiza com `Image.asset`

**Non-Goals:**
- Renomear o campo `emoji` em `_SlideData` / `_OnboardingSlide` (mínima alteração)
- Alterar tamanho, padding ou qualquer outro atributo visual das telas

## Decisions

**Manter o campo `emoji: String` em `_SlideData` / `_OnboardingSlide`, apenas mudar o valor e o renderer**
Renomear para `iconPath` seria mais semântico, mas adiciona diff desnecessário em uma classe privada interna. O compilador garante type safety — o campo já era `String` e continua sendo.

**`Image.asset` com `width` fixo equivalente ao `fontSize: 80` anterior**
`Text` com `fontSize: 80` ocupa ~80 logical pixels. `Image.asset` com `width: 80` preserva o tamanho visual. Usar `fit: BoxFit.contain`.

## Risks / Trade-offs

**Tamanho visual pode variar levemente** → PNGs do Noto Emoji têm proporção quadrada 1:1, resultado previsível com `width: 80`.
