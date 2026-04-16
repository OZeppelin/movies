## 1. CriarContaStep1Screen

- [ ] 1.1 Criar `lib/views/screens/criar_conta_step1_screen.dart` como `StatefulWidget`
- [ ] 1.2 Implementar `TextEditingController` para nome e telefone com `dispose`
- [ ] 1.3 Implementar progress bar: segmento 1 ativo (`AppColors.primary`), 2 e 3 inativos (`AppColors.inputBorder`)
- [ ] 1.4 Implementar botão ← que chama `Navigator.pop`
- [ ] 1.5 Implementar campos "Nome completo" (placeholder "Seu nome") e "Telefone" (placeholder "+55 (11) 99999-0000", `TextInputType.phone`)
- [ ] 1.6 Implementar botão "Continuar" que navega para `CriarContaStep2Screen` passando nome e telefone

## 2. CriarContaStep2Screen

- [ ] 2.1 Criar `lib/views/screens/criar_conta_step2_screen.dart` como `StatefulWidget` recebendo `nome` e `telefone`
- [ ] 2.2 Implementar `TextEditingController` para email, senha e confirmação com `dispose`
- [ ] 2.3 Implementar progress bar: segmentos 1 e 2 ativos, 3 inativo
- [ ] 2.4 Implementar botão ← que chama `Navigator.pop`
- [ ] 2.5 Implementar campos Email (`TextInputType.emailAddress`), Senha (`obscureText: true`) e Confirmar senha (`obscureText: true`)
- [ ] 2.6 Implementar validação: se senha ≠ confirmação, exibir `SnackBar` "As senhas não coincidem"
- [ ] 2.7 Implementar botão "Continuar" que navega para `CriarContaStep3Screen` passando nome, telefone e email (e senha)

## 3. CriarContaStep3Screen

- [ ] 3.1 Criar `lib/views/screens/criar_conta_step3_screen.dart` como `StatefulWidget` recebendo `nome`, `telefone`, `email` e `senha`
- [ ] 3.2 Implementar `_isLoading` com `setState` para feedback no botão
- [ ] 3.3 Implementar progress bar: todos os 3 segmentos ativos
- [ ] 3.4 Implementar botão ← que chama `Navigator.pop`
- [ ] 3.5 Implementar avatar: círculo 80×80px `AppColors.primary`, iniciais do nome em Inter Bold 28px `AppColors.dark`
- [ ] 3.6 Implementar texto "Alterar foto (opcional)" em 13px `AppColors.textSecondary`
- [ ] 3.7 Implementar seção de revisão: "Tudo certo! Revise abaixo:" + linha "email · telefone"
- [ ] 3.8 Implementar botão "Criar minha conta" com loading: chama `FirebaseAuth.instance.createUserWithEmailAndPassword`
- [ ] 3.9 Em sucesso: `Navigator.popUntil((r) => r.isFirst)`
- [ ] 3.10 Em erro: exibir `SnackBar` com mensagem do `FirebaseAuthException`

## 4. Atualizar main.dart

- [ ] 4.1 Importar `CriarContaStep1Screen` em `main.dart`
- [ ] 4.2 Passar `onRegister` à `SplashScreen` navegando para `CriarContaStep1Screen` via `Navigator.push`

## 5. Verificação

- [ ] 5.1 Executar `flutter analyze` e corrigir eventuais warnings
- [ ] 5.2 Executar o app no simulador e confirmar fluxo completo: Splash → Step1 → Step2 → Step3
