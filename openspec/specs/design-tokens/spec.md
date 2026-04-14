# Design Tokens

## Purpose

Define and export the foundational design tokens (colors, typography, spacing, border radius) as Figma Variables in the "movieApp DS — Library" file, named to match Flutter `ThemeData` paths for seamless design-to-code consistency.

## Requirements

### Requirement: Foundations exportadas como Figma Variables com naming Flutter ThemeData

O sistema SHALL criar uma coleção de Figma Variables no arquivo Library com tokens nomeados exatamente como os caminhos do Flutter `ThemeData`, cobrindo cores, tipografia, espaçamentos e border radius.

#### Scenario: Tokens de cor criados com naming Flutter

- **WHEN** o arquivo "movieApp DS — Library" é criado no Figma
- **THEN** SHALL existir uma coleção "colorScheme" com as variáveis: `primary` (#F5C142), `onPrimary` (#1A1A2E), `surface` (#FAFAFA), `onSurface` (#1A1A2E), `error` (#E53E3E), `onError` (#FFFFFF), `background` (#FAFAFA), `onBackground` (#1A1A2E)

#### Scenario: Tokens de tipografia criados com naming Flutter

- **WHEN** o arquivo "movieApp DS — Library" é criado no Figma
- **THEN** SHALL existir uma coleção "textTheme" com as variáveis: `titleLarge` (Bold 28px), `titleMedium` (SemiBold 22px), `bodyMedium` (Regular 16px), `bodySmall` (Regular 14px), `labelSmall` (Medium 12px)

#### Scenario: Tokens de espaçamento seguem grid de 4pt

- **WHEN** o arquivo "movieApp DS — Library" é criado no Figma
- **THEN** SHALL existir uma coleção "spacing" com valores: `xs` (4), `sm` (8), `md` (12), `lg` (16), `xl` (20), `2xl` (24), `3xl` (32), `4xl` (40), `5xl` (48)

#### Scenario: Tokens de border radius definidos

- **WHEN** o arquivo "movieApp DS — Library" é criado no Figma
- **THEN** SHALL existir uma coleção "borderRadius" com valores: `sm` (8), `md` (12), `lg` (16), `pill` (100)
