## 1. Dependências

- [ ] 1.1 Adicionar `google_sign_in: ^6.2.1` ao `pubspec.yaml`
- [ ] 1.2 Adicionar `sign_in_with_apple: ^7.0.1` ao `pubspec.yaml`
- [ ] 1.3 Executar `flutter pub get`

## 2. LoginScreen — estrutura e layout

- [ ] 2.1 Criar `lib/views/screens/login_screen.dart` como `StatefulWidget`
- [ ] 2.2 Implementar `TextEditingController` para email e senha com `dispose`
- [ ] 2.3 Implementar `bool _isLoading` com `setState`
- [ ] 2.4 Implementar logo: círculo 40px `AppColors.primary` com emoji 🎬 18px, centralizado no topo
- [ ] 2.5 Implementar "movieApp" Inter Bold 28px `AppColors.dark` centralizado abaixo do logo
- [ ] 2.6 Implementar título "Bem-vindo de volta" Inter Bold 24px `AppColors.dark` left 24px
- [ ] 2.7 Implementar campo Email (`TextInputType.emailAddress`) e campo Senha (`obscureText: true`)
- [ ] 2.8 Implementar link "Esqueci minha senha" alinhado à direita, 13px `AppColors.primary`, navega para `EsqueciSenhaScreen`
- [ ] 2.9 Implementar divisor "ou" com duas linhas horizontais cinza
- [ ] 2.10 Implementar link "Não tem conta? Criar agora" no rodapé, navega para `CriarContaStep1Screen`

## 3. LoginScreen — autenticação

- [ ] 3.1 Implementar botão "Entrar": validação de campos vazios (SnackBar "Preencha email e senha")
- [ ] 3.2 Implementar `signInWithEmailAndPassword` com loading e `try/catch FirebaseAuthException`
- [ ] 3.3 Em sucesso: `Navigator.popUntil((r) => r.isFirst)`
- [ ] 3.4 Implementar botão "Continue com Google": `GoogleSignIn().signIn()` → `GoogleAuthProvider.credential` → `signInWithCredential`
- [ ] 3.5 Em Google cancelado: retornar sem erro; em Google erro: SnackBar com mensagem
- [ ] 3.6 Implementar botão "Continue com Apple" (somente iOS via `defaultTargetPlatform`): `SignInWithApple.getAppleIDCredential` → `OAuthProvider("apple.com").credential` → `signInWithCredential`
- [ ] 3.7 Em Apple sucesso: `Navigator.popUntil((r) => r.isFirst)`

## 4. Conectar navegação

- [ ] 4.1 Importar `LoginScreen` em `onboarding_screen.dart`
- [ ] 4.2 Adicionar `onLogin` na instanciação da `SplashScreen` em `_onNext()` navegando para `LoginScreen`

## 5. Verificação

- [ ] 5.1 Executar `flutter analyze` e corrigir warnings
- [ ] 5.2 Executar o app no simulador e verificar renderização da `LoginScreen`
