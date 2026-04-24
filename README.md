# movieApp

> Projeto de estudo — Spec Driven Development com [OpenSpec](https://github.com/Anthropic/openspec) e Claude IA.

Aplicativo mobile de filmes construído em Flutter, com design system documentado no Figma e tokens alinhados ao `ThemeData` do Flutter.

## Sobre o projeto

Este repositório é um projeto de estudo que explora o **Spec Driven Development (SDD)** — uma abordagem em que cada mudança no projeto começa por artefatos de especificação (proposta, design, tarefas) antes de qualquer linha de código ser escrita.

O fluxo é conduzido pelo **OpenSpec**, uma ferramenta que organiza e rastreia os artefatos de cada mudança, e pelo **Claude IA**, que atua como parceiro em todas as etapas: exploração de ideias, criação de especificações, geração de design no Figma via MCP e implementação.

## Stack

- **Mobile:** Flutter (Dart)
- **State Management:** Provider
- **Backend:** Firebase (Auth, Realtime Database)
- **Auth providers:** Email/Senha, Google Sign-In, Sign in with Apple
- **Device:** device_info_plus (validação de dispositivo já cadastrado)
- **Design:** Figma (design system via MCP)
- **Workflow:** OpenSpec (spec-driven development)

## Arquitetura

O projeto segue **MVVM** (Model-View-ViewModel):

```
lib/
├── core/
│   ├── app_colors.dart          # Paleta de cores do design system
│   ├── app_icons.dart           # Ícones importados do Figma (SVG)
│   └── database_firebase.dart   # Referências do Firebase Realtime Database
├── models/
│   ├── user_model.dart          # Dados do usuário
│   └── log_user_model.dart      # Log de dispositivos cadastrados
├── services/
│   ├── user_service.dart        # CRUD de usuário no Realtime Database
│   └── login_service.dart       # Autenticação via Firebase Auth
├── viewmodels/
│   ├── base_view_model.dart     # ChangeNotifier base
│   ├── user_view_model.dart     # Fluxo de criação de conta
│   ├── login_view_model.dart    # Fluxo de login
│   └── esqueci_senha_view_model.dart
└── views/screens/
    ├── splash_screen.dart
    ├── onboarding_screen.dart   # 3 páginas de onboarding
    ├── criar_conta_step1_screen.dart
    ├── criar_conta_step2_screen.dart
    ├── criar_conta_step3_screen.dart
    ├── login_screen.dart
    └── esqueci_senha_screen.dart
```

## Telas implementadas

Splash → Onboarding (×3) → Criar Conta (×3) → Login → Esqueci minha senha

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
| `spacing/lg` | 16px (base do grid de 4pt) |
| `borderRadius/pill` | 100px |

### Componentes

`Button` · `Input` · `Avatar` · `MovieCard` · `RatingStars` · `GenreTag` · `BottomNav`

Todos os componentes usam Figma Auto Layout e variants no padrão `Type / State / Size`. Nenhuma cor é hardcoded — todas as propriedades referenciam Figma Variables da Library.

Os ícones do Figma são exportados como SVG e referenciados via `AppIcons` em `lib/core/app_icons.dart`.

## Histórico de mudanças (OpenSpec)

| Mudança | Data | Descrição |
|---|---|---|
| `movieapp-design-system-figma` | 2026-04-14 | Criação do design system no Figma: tokens, componentes e fluxo de login |
| `fix-textfield-width-login-flow` | 2026-04-14 | Correção da largura dos TextFields para `327px` em 6 telas |
| `iniciar-projeto-flutter-mvvm-firebase-cli` | 2026-04-15 | Setup do projeto Flutter com MVVM e Firebase CLI |
| `tela-splash` | 2026-04-15 | Implementação da Splash Screen |
| `fluxo-onboarding` | 2026-04-15 | Implementação das 3 telas de onboarding |
| `tela-esqueci-senha` | 2026-04-15 | Implementação da tela Esqueci minha senha |
| `fluxo-criar-conta` | 2026-04-16 | Implementação do fluxo de criação de conta (3 steps) |
| `add-database-firebase-core` | 2026-04-17 | Integração do Firebase Realtime Database |
| `add-user-service` | 2026-04-17 | UserService com CRUD no Realtime Database |
| `add-user-view-model` | 2026-04-17 | UserViewModel conectando UI ao UserService |
| `tela-login` | 2026-04-17 | Implementação da tela de login |
| `refactor-login-mvvm` | 2026-04-17 | Refatoração da tela de login para MVVM |
| `refactor-esqueci-senha-mvvm` | 2026-04-17 | Refatoração de Esqueci Senha para MVVM |
| `add-login-service` | 2026-04-22 | LoginService com Firebase Auth |
| `refactor-login-email-auth` | 2026-04-22 | Autenticação por email/senha via Firebase Auth |
| `import-figma-icons` | 2026-04-23 | Importação dos ícones SVG do Figma para `assets/icons/` |
| `replace-emojis-with-app-icons` | 2026-04-23 | Substituição de emojis pelos ícones do design system |
| `refactor-user-service-ref` | 2026-04-23 | Refatoração das referências do Firebase no UserService |
| `validate-device-already-registered` | 2026-04-23 | Validação de dispositivo já cadastrado via device_info_plus |
| `mask-telefone-cadastro` | 2026-04-23 | **Em andamento** — Máscara de telefone no fluxo de cadastro |

## Estrutura do repositório

```
openspec/
├── config.yaml              # Configuração do workflow OpenSpec
├── specs/                   # Especificações vivas do projeto
│   ├── design-tokens/
│   ├── component-library/
│   ├── login-flow/
│   ├── onboarding-flow/
│   ├── criar-conta-flow/
│   ├── splash-screen/
│   ├── esqueci-senha-screen/
│   ├── esqueci-senha-viewmodel/
│   ├── login-auth/
│   ├── login-service/
│   ├── user-model/
│   ├── user-service/
│   ├── user-view-model/
│   ├── app-icons/
│   ├── phone-mask-formatter/
│   ├── firebase-cli-setup/
│   └── firebase-realtime-database-config/
└── changes/
    ├── mask-telefone-cadastro/   # Mudança em andamento
    └── archive/                  # Mudanças concluídas
```


https://github.com/user-attachments/assets/6a9de6a0-a134-4402-b99e-9ec320ae581a

