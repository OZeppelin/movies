# movieApp

> Projeto de estudo — Spec Driven Development com [OpenSpec](https://github.com/Anthropic/openspec) e Claude IA.

Aplicativo mobile de filmes construído em Flutter, com design system documentado no Figma e tokens alinhados ao `ThemeData` do Flutter.

## Sobre o projeto

Este repositório é um projeto de estudo que explora o **Spec Driven Development (SDD)** — uma abordagem em que cada mudança no projeto começa por artefatos de especificação (proposta, design, tarefas) antes de qualquer linha de código ser escrita.

O fluxo é conduzido pelo **OpenSpec**, uma ferramenta que organiza e rastreia os artefatos de cada mudança, e pelo **Claude IA**, que atua como parceiro em todas as etapas: exploração de ideias, criação de especificações, geração de design no Figma via MCP e implementação.

## Visão geral

O movieApp permite ao usuário descobrir, avaliar e salvar filmes em uma watchlist. A identidade visual é inspirada no app Taxio — amarelo âmbar `#F5C142` sobre dark `#1A1A2E` —, combinação que evoca a atmosfera do cinema sem abrir mão de legibilidade.

## Stack

- **Mobile:** Flutter (Dart)
- **Design:** Figma (design system via MCP)
- **Workflow:** OpenSpec (spec-driven development)

## Design System

O design system é composto por dois arquivos Figma independentes:

| Arquivo | Conteúdo |
|---|---|
| `movieApp DS — Library` | Tokens (Figma Variables), componentes reutilizáveis |
| `movieApp DS — Login Flow` | 11 telas do fluxo de autenticação conectadas via protótipo |

### Tokens

Os tokens seguem o naming do Flutter `ThemeData` para eliminar mapeamento adicional na implementação:

| Token | Valor |
|---|---|
| `colorScheme/primary` | `#F5C142` |
| `colorScheme/onPrimary` | `#1A1A2E` |
| `colorScheme/surface` | `#FAFAFA` |
| `colorScheme/error` | `#E53E3E` |
| `textTheme/titleLarge` | Bold, 28px |
| `textTheme/bodyMedium` | Regular, 16px |

### Componentes

`Button` · `Input` · `Avatar` · `MovieCard` · `RatingStars` · `GenreTag` · `BottomNav`

Todos os componentes usam Figma Auto Layout e variants no padrão `Type / State / Size`.

### Fluxo de autenticação (11 telas)

Splash → Onboarding (×3) → Cadastro (×3) → OTP → Login → Biometria → Esqueci minha senha

## Estrutura do repositório

```
openspec/
├── config.yaml          # Configuração do workflow OpenSpec
├── specs/               # Especificações principais do projeto
└── changes/             # Mudanças em andamento e arquivadas
    └── movieapp-design-system-figma/
        ├── proposal.md  # O quê e por quê
        ├── design.md    # Decisões de arquitetura
        └── tasks.md     # Tarefas de implementação
```
