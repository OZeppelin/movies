## 1. Constantes de Cores (AppColors)

- [x] 1.1 Criar o arquivo `lib/core/app_colors.dart`
- [x] 1.2 Definir a classe `AppColors` com as constantes: `background` (`#FAFAFA`), `primary` (`#F5C142`), `dark` (`#1A1A2E`), `textSecondary` (`#8C8C94`)

## 2. SplashScreen — Widget

- [x] 2.1 Criar o arquivo `lib/views/screens/splash_screen.dart`
- [x] 2.2 Declarar `SplashScreen` como `StatelessWidget` com parâmetros opcionais `onLogin`, `onRegister` e `onForgotPassword` (callbacks `VoidCallback?`)
- [x] 2.3 Implementar o `Scaffold` com `backgroundColor: AppColors.background`
- [x] 2.4 Implementar a seção do logo: `Container` circular 100×100px com `color: AppColors.primary` e `Text('🎬', fontSize: 44)` centralizado dentro
- [x] 2.5 Implementar o título "movieApp" com `FontWeight.bold`, `fontSize: 32`, `color: AppColors.dark`, centralizado
- [x] 2.6 Implementar a tagline "Seu cinema na palma da mão" com `fontSize: 16`, `color: AppColors.textSecondary`, centralizado
- [x] 2.7 Implementar o botão "Entrar" como `ElevatedButton` com `backgroundColor: AppColors.primary`, `foregroundColor: AppColors.dark`, `fontSize: 15`, `FontWeight.w600`, altura 52px, borda arredondada (`BorderRadius.circular(100)`), largura total menos 48px de margem horizontal
- [x] 2.8 Implementar o botão "Criar conta" como `OutlinedButton` com `side: BorderSide(color: AppColors.dark, width: 1.5)`, mesmas dimensões do botão "Entrar", texto `color: AppColors.dark`
- [x] 2.9 Implementar o link "Esqueci minha senha" como `TextButton` ou `GestureDetector` com `Text` de `fontSize: 13`, `color: AppColors.textSecondary`, centralizado
- [x] 2.10 Compor o layout com `Column` + `Spacer` distribuindo logo/textos no topo e botões na base, com `padding` horizontal de 24px

## 3. Integração no main.dart

- [x] 3.1 Adicionar `import` da `SplashScreen` em `lib/main.dart`
- [x] 3.2 Substituir o `home: Scaffold(...)` placeholder por `home: SplashScreen()` no `MaterialApp`

## 4. Verificação

- [x] 4.1 Executar `flutter analyze` e corrigir eventuais warnings ou erros
- [x] 4.2 Executar o app no simulador iOS e confirmar que a `SplashScreen` aparece corretamente
- [x] 4.3 Verificar visualmente que logo, título, tagline e botões estão posicionados conforme o design Figma `01-Splash`
