## Context

O projeto já tem `SplashScreen`, `EsqueciSenhaScreen` e `AppColors`. O `main.dart` atualmente inicia em `SplashScreen`. Esta mudança insere o Onboarding como primeira tela, redirecionando para a Splash ao final.

Os 3 slides têm estrutura idêntica (header colorido + emoji + título + subtítulo + dots + botão) — apenas as cores, emojis e textos diferem. Isso aponta para uma implementação com `PageView` e um único widget de slide parametrizado.

## Goals / Non-Goals

**Goals:**
- Implementar `OnboardingScreen` com `PageView` de 3 slides
- Widget `_OnboardingSlide` reutilizável e parametrizado (cor, emoji, título, subtítulo)
- Dots de progresso sincronizados com o `PageController`
- Botão "Próximo" avança o `PageView`; "Começar" navega para `SplashScreen` com `pushReplacement`
- `main.dart` usa `OnboardingScreen` como `home`

**Non-Goals:**
- Persistir que o usuário já fez onboarding (SharedPreferences) — pode ser adicionado depois
- Animações de transição customizadas entre slides
- Botão "Pular" para ir direto à Splash

## Decisions

### 1. PageView com PageController (não Navigator.push entre telas separadas)

**Decisão**: Usar um único `OnboardingScreen` com `PageView` e `PageController` para os 3 slides.

**Rationale**: Os slides compartilham estado (índice atual para dots e lógica do botão). Gerenciar isso com Navigator.push entre telas separadas exigiria passar estado entre rotas. `PageView` mantém tudo encapsulado, é mais fluido (swipe gesture) e é o padrão Flutter para onboarding.

**Alternativa considerada**: 3 telas separadas com Navigator.push — descartado pela complexidade de estado.

### 2. Widget _OnboardingSlide como componente interno parametrizado

**Decisão**: Criar um `_OnboardingSlide` privado (prefixo `_`) dentro do arquivo `onboarding_screen.dart`.

**Rationale**: Os 3 slides são idênticos em estrutura. Parametrizar com `headerColor`, `emoji`, `title`, `subtitle` evita 200+ linhas de código duplicado. Por ser usado só neste arquivo, não precisa ser exportado.

### 3. StatefulWidget com PageController no OnboardingScreen

**Decisão**: `OnboardingScreen` é `StatefulWidget` com `_currentPage` e `PageController`.

**Rationale**: O estado da página atual precisa ser reativo para atualizar os dots e o texto do botão. `setState` é suficiente — sem necessidade de ViewModel para esse estado de navegação puro.

### 4. pushReplacement ao sair do Onboarding

**Decisão**: Usar `Navigator.pushReplacement` ao navegar para `SplashScreen`.

**Rationale**: O usuário não deve poder voltar ao onboarding com o botão de voltar do sistema depois de chegar na Splash. `pushReplacement` remove o `OnboardingScreen` da pilha.

### 5. Dots: Container com BorderRadius (não assets de imagem)

**Decisão**: Implementar os dots com `AnimatedContainer` — dot ativo: 20×8px `AppColors.primary`; inativo: 8×8px `AppColors.inputBorder`. Sem usar imagens.

**Rationale**: O Figma usa assets de imagem para os dots, mas são simplesmente formas geométricas. `AnimatedContainer` é mais limpo, sem dependência de assets, e permite animação suave na transição.

## Risks / Trade-offs

- **Sem persistência de onboarding visto** → O usuário verá o onboarding toda vez que abrir o app. Mitigação: aceitável para MVP; `SharedPreferences` pode ser adicionado em mudança futura.
- **Swipe desativado no PageView** → Por padrão o `PageView` permite swipe. Pode ser confuso se o usuário fizer swipe para o último slide e tentar avançar. Mitigação: manter swipe habilitado (comportamento natural de onboarding).
