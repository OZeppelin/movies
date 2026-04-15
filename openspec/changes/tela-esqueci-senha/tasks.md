## 1. Atualizar AppColors

- [ ] 1.1 Adicionar `AppColors.white` (`#FFFFFF`), `AppColors.inputBackground` (`#F5F5F5`) e `AppColors.inputBorder` (`#D1D1D1`) em `lib/core/app_colors.dart`

## 2. EsqueciSenhaScreen — Widget

- [ ] 2.1 Criar o arquivo `lib/views/screens/esqueci_senha_screen.dart`
- [ ] 2.2 Declarar `EsqueciSenhaScreen` como `StatefulWidget` com `TextEditingController` para o campo de email
- [ ] 2.3 Implementar o `Scaffold` com `backgroundColor: AppColors.white`
- [ ] 2.4 Implementar botão voltar `←` no topo esquerdo via `GestureDetector` que chama `Navigator.pop(context)`
- [ ] 2.5 Implementar o título "Recuperar senha" — Inter Bold 26px, `AppColors.dark`
- [ ] 2.6 Implementar o subtítulo "Informe seu email e enviaremos um link de redefinição." — 15px, `AppColors.textSecondary`
- [ ] 2.7 Implementar ícone ✉ em círculo `AppColors.primary` de 80×80px, centralizado
- [ ] 2.8 Implementar label "Email" — Inter SemiBold 12px, `AppColors.dark`
- [ ] 2.9 Implementar `TextField` com `InputDecoration`: fundo `AppColors.inputBackground`, borda `AppColors.inputBorder`, `borderRadius: BorderRadius.circular(12)`, altura 52px, placeholder "usuario@email.com", `keyboardType: TextInputType.emailAddress`
- [ ] 2.10 Implementar botão "Enviar link de recuperação" — `ElevatedButton` amarelo `AppColors.primary`, pill, 52px, full width, Inter SemiBold 15px, `AppColors.dark`
- [ ] 2.11 Implementar link "Lembrei minha senha — Entrar" — `GestureDetector` com `Text` 13px `AppColors.textSecondary`, centralizado, que chama `Navigator.pop(context)`
- [ ] 2.12 Compor layout com `Column` + `Spacer`, padding horizontal 24px, `SafeArea`
- [ ] 2.13 Chamar `_emailController.dispose()` no `dispose()` do State

## 3. Navegação da SplashScreen

- [ ] 3.1 Em `lib/main.dart`, passar `onForgotPassword` para `SplashScreen` com `Navigator.push(context, MaterialPageRoute(builder: (_) => const EsqueciSenhaScreen()))`
- [ ] 3.2 Adicionar import de `EsqueciSenhaScreen` em `lib/main.dart`

## 4. Verificação

- [ ] 4.1 Executar `flutter analyze` e corrigir eventuais warnings ou erros
- [ ] 4.2 Executar o app no simulador e verificar que tocar "Esqueci minha senha" abre a `EsqueciSenhaScreen`
- [ ] 4.3 Verificar que botão `←` e link "Lembrei minha senha" retornam para a Splash
- [ ] 4.4 Verificar visualmente que o layout está fiel ao design Figma `11-Esqueci-Senha`
