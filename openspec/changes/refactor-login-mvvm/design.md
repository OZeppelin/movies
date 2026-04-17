## Context

O projeto usa `provider` com `BaseViewModel extends ChangeNotifier`. Só existe um ViewModel hoje (`BaseViewModel`). A `LoginScreen` atual é `StatefulWidget` com `TextEditingController` e lógica de auth direto no `State`. O `pubspec.yaml` já tem `provider`, `firebase_auth`, `google_sign_in ^7.0.0` e `sign_in_with_apple`.

## Goals / Non-Goals

**Goals:**
- `LoginViewModel extends BaseViewModel` com validação, `entrarComEmail`, `entrarComGoogle`, `entrarComApple`
- Cada método retorna `bool` — `true` = sucesso (View navega), `false` = erro (View exibe SnackBar com `viewModel.errorMessage`)
- `LoginScreen` vira `StatelessWidget` com `ChangeNotifierProvider` + `Consumer<LoginViewModel>`
- `TextEditingController`s ficam na View (estado de formulário puro, não negócio)
- Firebase/Google/Apple imports saem da View

**Non-Goals:**
- Injeção de dependência (DI) via `get_it` ou similar
- Testes unitários do ViewModel (pode ser adicionado depois)
- Mudança visual ou de navegação

## Decisions

### 1. Métodos retornam bool (não callback nem stream)

**Decisão**: `entrarComEmail`, `entrarComGoogle`, `entrarComApple` retornam `Future<bool>`. A View `await`a o resultado e chama `Navigator.popUntil` se `true`.

**Rationale**: Simples, direto, sem acoplamento. O ViewModel não conhece `BuildContext` nem `Navigator`. A View controla quando navegar. `Stream` ou callbacks seriam over-engineering para uma operação one-shot.

### 2. errorMessage exposto como propriedade + notifyListeners

**Decisão**: `String? _errorMessage` com getter `errorMessage`. Cada método de auth seta `_errorMessage` antes de chamar `notifyListeners()` em caso de erro. A View observa via `Consumer` e exibe SnackBar quando `errorMessage != null`.

**Rationale**: O padrão `ChangeNotifier` do projeto. Evita `Stream<String>` desnecessário. A View limpa o erro após exibi-lo (`viewModel.clearError()`).

### 3. TextEditingControllers ficam na View

**Decisão**: Os controllers de email e senha permanecem na View como campos locais (criados diretamente no `StatelessWidget` via `initState` de um `State` wrapper mínimo — ou via `ConsumerStatefulWidget`).

**Rationale**: `TextEditingController` é estado de UI (não negócio) e precisa de `dispose`. Movê-los ao ViewModel aumentaria o escopo sem benefício real. A View passa `controller.text` como parâmetro ao ViewModel.

**Alternativa**: `StatelessWidget` puro com `Provider` — descartado porque `TextEditingController.dispose()` exige `State`. Solução: `LoginScreen` será `StatefulWidget` slim — só cuida dos controllers e chama `Consumer<LoginViewModel>` para tudo que depende de estado reativo.

### 4. ChangeNotifierProvider scoped na LoginScreen

**Decisão**: Criar o `LoginViewModel` via `ChangeNotifierProvider(create: (_) => LoginViewModel())` dentro do próprio `build` da `LoginScreen` (ou seja, o provider é scoped para a tela).

**Rationale**: O ViewModel tem escopo de tela — não precisa ser global. Manter o provider scoped evita memory leaks e segue o princípio de escopo mínimo.

### 5. LoginScreen mantém StatefulWidget (slim)

**Decisão**: `LoginScreen` continua como `StatefulWidget` só para gerenciar os `TextEditingController`s com `dispose`. O corpo do `build` usa `Consumer<LoginViewModel>`.

**Rationale**: Alternativa `StatelessWidget` exigiria `ConsumerStatefulWidget` do `flutter_riverpod` (não usado) ou hacks. O `StatefulWidget` slim (só controllers) é mais idiomático com `provider`.
