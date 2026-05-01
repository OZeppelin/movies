## Context

O movieApp é um projeto React/Node.js web existente. Este design cobre a implementação de um novo aplicativo mobile em React Native, compartilhando apenas contexto de domínio (filmes) com o projeto web — sem compartilhamento de código de UI. O app será criado do zero usando React Native 0.85+ com Nova Arquitetura habilitada.

Fluxo de autenticação completo extraído do Figma (`lT8Jhe8Q1HzH7yWgjFCUBh`): Splash → Onboarding (3 telas) → Login/Cadastro/Esqueci Senha + Biometria.

Design system extraído da biblioteca Figma (`y1I12bNB9OsHCw6IU1h16e`):
- **Cores**: `primary: #f5c142`, `onPrimary: #1a1a2e`, `surface: #fafafa`, `onSurface: #1a1a2e`, `error: #e53e3e`, `onError: #ffffff`, `background: #fafafa`, `onBackground: #1a1a2e`, `placeholder: #8c8c94`, `border: #d1d1d1`
- **Tipografia** (Inter): `titleLarge: 28px/Bold`, `titleMedium: 22px/SemiBold`, `bodyMedium: 16px/Regular`, `bodySmall: 14px/Regular`, `labelSmall: 12px/Medium`
- **Componentes base**: `AppButton` (pill, height 52px, radius 100px), `AppInput` (height 52px, radius 12px, bg `#f5f5f5`, border `#d1d1d1`)

## Goals / Non-Goals

**Goals:**
- App React Native 0.85+ com Nova Arquitetura (JSI/Fabric/TurboModules) ativada
- Design system tipado em TypeScript, fiel à biblioteca Figma
- Fluxo completo: Splash → Onboarding → Login → Cadastro multi-step (OTP) → Biometria → Esqueci Senha
- TypeScript strict em todo o projeto
- Suporte iOS 26+ e Android 8+ (API 26+)
- BundleID do projeto: com.example.movies

**Non-Goals:**
- Backend de autenticação (API stubs / mocks serão usados)
- Telas pós-login (catálogo, detalhes de filme)
- Modo offline / caching de conteúdo
- Internacionalização (i18n) — app em pt-BR apenas
- Testes E2E / Detox nesta fase

## Decisions

### 1. Nova Arquitetura React Native (JSI/Fabric)

**Decisão**: `newArchEnabled=true` no `gradle.properties` e `Podfile`. Usar apenas libs compatíveis com Nova Arquitetura.

**Alternativas consideradas**: Arquitetura legada (Bridge) — descartada pois o usuário explicitamente solicitou JSI/Fabric e é o padrão do RN 0.85+.

**Rationale**: Performance nativa superior (comunicação síncrona JS→Native via JSI), sem serialização JSON no bridge, Fabric renderiza componentes diretamente.

---

### 2. Navegação: React Navigation v7

**Decisão**: `@react-navigation/native` v7 + `@react-navigation/native-stack` usando `react-native-screens`.

**Estrutura de rotas**:
```
RootStack
  ├── Onboarding        ← top-level; exibida uma vez na vida (não parte do auth)
  ├── AuthStack (Stack)
  │   ├── Splash
  │   ├── Login
  │   ├── RegisterStep1
  │   ├── RegisterStep2
  │   ├── RegisterStep3
  │   ├── OTPVerification
  │   ├── ForgotPassword
  │   └── Biometric
  └── AppStack (placeholder para futuro)
```

**Decisões de estrutura**:
- Onboarding é tutorial de produto, não autenticação → top-level no RootStack, não dentro do AuthStack
- Cada step do cadastro é rota própria na stack → back button Android nativo gratuito, transições nativas entre steps

**Alternativas**: Expo Router (file-based) — descartado pois o projeto não usa Expo SDK; React Navigation v6 — descartado pois v7 já é estável e compatível com Nova Arquitetura.

---

### 3. Design System: tokens TypeScript + StyleSheet

**Decisão**: Tokens de cor e tipografia como constantes TypeScript (`src/theme/colors.ts`, `src/theme/typography.ts`, `src/theme/spacing.ts`). Componentes base (`AppButton`, `AppInput`, `AppText`) usam `StyleSheet.create` com os tokens.

**Alternativas**:
- Styled-components / Emotion — descartados por overhead e incompatibilidade parcial com Nova Arquitetura
- Tamagui — descartado por complexidade de setup e curva de aprendizado

**Rationale**: `StyleSheet.create` é a abordagem oficial RN, sem dependências extras, com otimização nativa de estilos.

---

### 4. Gerenciamento de Estado de Autenticação: Context API + Reducer

**Decisão**: `AuthContext` com `useReducer` para estado global de autenticação. Persistência de sessão via `@react-native-async-storage/async-storage`.

**Alternativas**: Redux Toolkit (overhead excessivo para escopo atual), Zustand (válido, mas Context é suficiente e sem dependência extra).

---

### 5. Biometria: react-native-biometrics

**Decisão**: `react-native-biometrics` para abstração de Face ID (iOS) e Fingerprint/Face (Android). Compatível com Nova Arquitetura via TurboModules.

---

### 6. Máscara de telefone: react-native-mask-input

**Decisão**: `react-native-mask-input` para input de telefone com máscara `+55 (99) 99999-9999`. Compatível com Nova Arquitetura.

**Alternativa**: `react-native-masked-text` — descartado por falta de manutenção e incompatibilidade com Nova Arquitetura.

---

### 7. Fonte Inter: assets locais

**Decisão**: Fontes Inter bundladas localmente (`assets/fonts/`). Link via `react-native.config.js`. Evita dependência de rede em runtime.

**Pesos necessários**: Regular (400), Medium (500), SemiBold (600), Bold (700).

---

### 8. Estado compartilhado do cadastro: RegisterContext

**Decisão**: `RegisterContext` leve em `src/contexts/RegisterContext.tsx` com os campos dos 3 steps (name, phone, email, password). Cada tela `RegisterStep*` lê e escreve neste contexto. O context é destruído ao sair do fluxo de cadastro (cancelamento ou conclusão).

**Alternativa**: Passar dados via navigation params acumulados — descartado pois tipagem dos params fica verbosa e acoplada entre telas.

---

### 9. Feedback de login bem-sucedido: Toast

**Decisão**: Exibir toast não-bloqueante "Login realizado com sucesso!" via `react-native-toast-message` após credenciais validadas, antes de navegar para AppStack.

**Rationale**: Toast é não-intrusivo — usuário não precisa confirmar nada, app já navega em seguida. `Alert.alert()` (bloqueante) reservado para erros e ações destrutivas.

## Risks / Trade-offs

| Risco | Mitigação |
|-------|-----------|
| Biblioteca de biometria pode ter issues em versões novas do iOS/Android | Fixar versão compatível e testar em devices reais no CI |
| Nova Arquitetura pode ter incompatibilidades com libs de terceiros | Verificar todas as libs na [lista de compatibilidade RN](https://github.com/reactwg/react-native-new-architecture/discussions/167) antes de adicionar |
| Multi-step forms com OTP aumentam complexidade de estado | Isolar cada step em componente próprio com estado local; só subir ao context no submit final |
| Variações de tamanho de tela (375px design, telas menores/maiores) | Usar `Dimensions` ou `react-native-responsive-screen` para scaling relativo |

## Migration Plan

1. Criar projeto RN na pasta `mobile/` dentro do monorepo (`/movies/mobile`)
2. Configurar Nova Arquitetura e verificar build limpo em iOS e Android
3. Implementar design system (tokens + componentes base)
4. Implementar navegação (RootStack vazio funcional)
5. Implementar telas na ordem do fluxo: Splash → Onboarding → Login → Cadastro → ForgotPassword → Biometria
6. Integrar biometria e AsyncStorage
7. Smoke test manual nos simuladores iOS e Android

**Rollback**: O projeto mobile está em pasta separada (`mobile/`). Nenhuma alteração no código web existente.

## Open Questions

- [ ] A API de autenticação já existe? Se sim, qual o endpoint base e formato JWT? (Atualmente o design assume mocks)
- [ ] Google Sign-In requer `google-services.json` e `GoogleService-Info.plist` — cliente tem as credenciais?
- [ ] Apple Sign-In requer entitlement `com.apple.developer.applesignin` configurado no Apple Developer — já está configurado?
- [ ] Nome do bundle ID: `com.movieapp.mobile`? Confirmar antes do setup de biometria
