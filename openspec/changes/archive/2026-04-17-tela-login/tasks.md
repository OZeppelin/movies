## 1. Dependências

- [x] 1.1 Adicionar `google_sign_in: ^6.2.1` ao `pubspec.yaml`
- [x] 1.2 Adicionar `sign_in_with_apple: ^7.0.1` ao `pubspec.yaml`
- [x] 1.3 Executar `flutter pub get`

## 2. LoginScreen — estrutura e layout

- [x] 2.1 Criar `lib/views/screens/login_screen.dart` como `StatefulWidget`
- [x] 2.2 Implementar `TextEditingController` para email e senha com `dispose`
- [x] 2.3 Implementar `bool _isLoading` com `setState`
- [x] 2.4 Implementar logo: círculo 40px `AppColors.primary` com emoji 🎬 18px, centralizado no topo
- [x] 2.5 Implementar "movieApp" Inter Bold 28px `AppColors.dark` centralizado abaixo do logo
- [x] 2.6 Implementar título "Bem-vindo de volta" Inter Bold 24px `AppColors.dark` left 24px
- [x] 2.7 Implementar campo Email (`TextInputType.emailAddress`) e campo Senha (`obscureText: true`)
- [x] 2.8 Implementar link "Esqueci minha senha" alinhado à direita, 13px `AppColors.primary`, navega para `EsqueciSenhaScreen`
- [x] 2.9 Implementar divisor "ou" com duas linhas horizontais cinza
- [x] 2.10 Implementar link "Não tem conta? Criar agora" no rodapé, navega para `CriarContaStep1Screen`

## 3. LoginScreen — autenticação

- [x] 3.1 Implementar botão "Entrar": validação de campos vazios (SnackBar "Preencha email e senha")
- [x] 3.2 Implementar `signInWithEmailAndPassword` com loading e `try/catch FirebaseAuthException`
- [x] 3.3 Em sucesso: `Navigator.popUntil((r) => r.isFirst)`
- [x] 3.4 Implementar botão "Continue com Google": `GoogleSignIn().signIn()` → `GoogleAuthProvider.credential` → `signInWithCredential`
- [x] 3.5 Em Google cancelado: retornar sem erro; em Google erro: SnackBar com mensagem
- [x] 3.6 Implementar botão "Continue com Apple" (somente iOS via `defaultTargetPlatform`): `SignInWithApple.getAppleIDCredential` → `OAuthProvider("apple.com").credential` → `signInWithCredential`
- [x] 3.7 Em Apple sucesso: `Navigator.popUntil((r) => r.isFirst)`

## 4. Conectar navegação

- [x] 4.1 Importar `LoginScreen` em `onboarding_screen.dart`
- [x] 4.2 Adicionar `onLogin` na instanciação da `SplashScreen` em `_onNext()` navegando para `LoginScreen`

## 5. Verificação

- [x] 5.1 Executar `flutter analyze` e corrigir warnings
- [x] 5.2 Executar o app no simulador e verificar renderização da `LoginScreen`
