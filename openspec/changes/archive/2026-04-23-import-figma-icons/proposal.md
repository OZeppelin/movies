## Why

O projeto usa caracteres emoji como ícones visuais (🎬, 👆, 🍿, ⭐, ✉) definidos no Figma, convertê-los para .PNG e importá-los para o projeto flutter. Mas atualmente não há um ponto central de referência no código Flutter — cada tela que precisar usá-los precisará hardcodar o string/emoji diretamente.

## What Changes

- Criar `lib/core/app_icons.dart` com uma classe `AppIcons` contendo constantes para todos os ícones visuais do design system (emojis e caracteres especiais mapeados do Figma)
- Nenhuma dependência externa nova necessária

## Capabilities

### New Capabilities
- `app-icons`: Centraliza todos os ícones/emojis/imagens visuais do design system em um único arquivo de constantes

### Modified Capabilities
(nenhuma)

## Impact

- `lib/core/app_icons.dart` — arquivo novo
