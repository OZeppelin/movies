## Context

O projeto já tem `SplashScreen` (com `onLogin` callback), `EsqueciSenhaScreen`, `CriarContaStep1Screen`, `AppColors` e `firebase_auth` instalado. O padrão de telas estabelecido é `StatefulWidget` + `TextEditingController`. A navegação para `LoginScreen` virá de `onboarding_screen.dart` (onde a `SplashScreen` é instanciada).

## Goals / Non-Goals

**Goals:**
- `LoginScreen` como `StatefulWidget` com email e senha
- Validação de campos obrigatórios antes de chamar Firebase (SnackBar se vazio)
- `signInWithEmailAndPassword` com loading state e tratamento de erros
- Google Sign-In via `google_sign_in` + `GoogleAuthProvider` do Firebase
- Apple Sign-In via `sign_in_with_apple` + `OAuthProvider` do Firebase
- Após qualquer login bem-sucedido: `Navigator.popUntil(isFirst)`
- Links para `EsqueciSenhaScreen` e `CriarContaStep1Screen`

**Non-Goals:**
- "Lembrar login" (persist session além do Firebase default)
- Tela home após login (MVP retorna à SplashScreen)
- Configuração de SHA-1/SHA-256 no Firebase Console (pré-requisito externo ao código)

## Decisions

### 1. StatefulWidget sem ViewModel

**Decisão**: `LoginScreen` como `StatefulWidget` com `TextEditingController` e `bool _isLoading`.

**Rationale**: Mesmo padrão de `EsqueciSenhaScreen` e `CriarContaStep3Screen`. Estado é puramente de UI. Sem lógica compartilhada que justifique ViewModel.

### 2. Validação de campos antes de chamar Firebase

**Decisão**: Se email ou senha estiverem vazios, exibir `SnackBar` "Preencha email e senha" sem chamar Firebase.

**Rationale**: Evita chamada de rede desnecessária. O Figma não mostra estados de erro inline nos campos, então SnackBar é consistente com o padrão da app (usado em Step2 e Step3).

### 3. Google Sign-In com google_sign_in + GoogleAuthProvider

**Decisão**: Usar `google_sign_in` para obter `GoogleSignInAccount`, depois criar `GoogleAuthProvider.credential` e chamar `FirebaseAuth.instance.signInWithCredential`.

**Rationale**: Padrão oficial FlutterFire para Google Sign-In. O `google_sign_in` lida com o fluxo OAuth nativo e retorna os tokens necessários.

### 4. Apple Sign-In com sign_in_with_apple + OAuthProvider

**Decisão**: Usar `sign_in_with_apple` para obter `AuthorizationCredentialAppleID`, depois criar `OAuthProvider("apple.com").credential` e chamar `FirebaseAuth.instance.signInWithCredential`.

**Rationale**: Padrão oficial para Apple Sign-In no Flutter. Necessário para apps iOS na App Store que oferecem login social.

### 5. Botões Google/Apple como OutlinedButton com texto (sem assets de imagem)

**Decisão**: "G" em texto 16px para Google; "🍎" emoji para Apple. Ambos como `OutlinedButton` com borda `AppColors.inputBorder`.

**Rationale**: O Figma usa apenas "G" como texto para Google e um caractere de ícone para Apple. Evita dependência de assets de imagem no MVP. Pode ser substituído por ícones SVG depois.

### 6. Navegação: onLogin conectado em onboarding_screen.dart

**Decisão**: Adicionar `onLogin` na instanciação da `SplashScreen` dentro de `_OnboardingScreenState._onNext()` em `onboarding_screen.dart`.

**Rationale**: A `SplashScreen` já é instanciada ali com `onForgotPassword` e `onRegister`. Adicionar `onLogin` segue o mesmo padrão já estabelecido.

## Risks / Trade-offs

- **Google Sign-In requer configuração no Firebase Console + google-services.json atualizado** → O `google_sign_in` funciona em runtime mas pode falhar se o SHA não estiver configurado no Android. No iOS, o `GoogleService-Info.plist` precisa ter o `REVERSED_CLIENT_ID` nas URL Schemes. Mitigação: documentar como task de verificação.
- **Apple Sign-In requer entitlement no Xcode** → "Sign In with Apple" capability precisa ser ativada no Xcode. Mitigação: task de verificação incluída.
- **sign_in_with_apple em Android** → Requer configuração de serviço redirect. Mitigação: para MVP, o botão Apple só será exibido no iOS (`defaultTargetPlatform == TargetPlatform.iOS`).
