## 1. Setup do Projeto React Native

- [x] 1.1 Criar projeto React Native 0.85+ em `mobile/` com template TypeScript: `npx @react-native-community/cli@latest init movieAppMobile --template react-native-template-typescript`
- [x] 1.2 Habilitar Nova Arquitetura: `newArchEnabled=true` em `android/gradle.properties` e `RCT_NEW_ARCH_ENABLED=1` no Podfile iOS
- [x] 1.3 Configurar TypeScript strict: `"strict": true` em `tsconfig.json`
- [x] 1.4 Instalar dependências de navegação: `@react-navigation/native`, `@react-navigation/native-stack`, `react-native-screens`, `react-native-safe-area-context`
- [x] 1.5 Instalar dependências de autenticação e utilitários: `@react-native-async-storage/async-storage`, `react-native-biometrics`, `react-native-mask-input`, `react-native-toast-message`
- [x] 1.6 Instalar dependências de login social: `@react-native-google-signin/google-signin`, `@invertase/react-native-apple-authentication`
- [ ] 1.7 Rodar `pod install` em `mobile/ios/` e verificar build limpo em iOS Simulator e Android Emulator

## 2. Design System — Tokens e Componentes Base

- [x] 2.1 Adicionar fontes Inter (Regular, Medium, SemiBold, Bold) em `mobile/assets/fonts/` e configurar `react-native.config.js` para link automático
- [x] 2.2 Criar `src/theme/colors.ts` com todos os tokens de cor do Figma (primary, onPrimary, surface, onSurface, error, onError, background, onBackground, placeholder, border)
- [x] 2.3 Criar `src/theme/typography.ts` com escala tipográfica Inter (titleLarge 28/Bold, titleMedium 22/SemiBold, bodyMedium 16/Regular, bodySmall 14/Regular, labelSmall 12/Medium)
- [x] 2.4 Criar `src/theme/spacing.ts` com escala de espaçamento (xs:4, sm:8, md:16, lg:24, xl:32, xxl:48)
- [x] 2.5 Criar componente `src/components/AppButton.tsx` com variantes `primary` e `outline` (height 52, borderRadius 100, disabled com opacity 0.5)
- [x] 2.6 Criar componente `src/components/AppInput.tsx` com label, placeholder, secureTextEntry, errorMessage (bg #f5f5f5, border #d1d1d1, borderRadius 12, height 52, padding 16)
- [x] 2.7 Criar componente `src/components/AppText.tsx` wrappando Text com tipografia tipada

## 3. Navegação — RootStack e Tipos

- [x] 3.1 Criar `src/navigation/types.ts` com `RootStackParamList` tipando todas as rotas: `Onboarding`, `Splash`, `Login`, `RegisterStep1`, `RegisterStep2`, `RegisterStep3`, `OTPVerification`, `ForgotPassword`, `Biometric`, `Home`
- [x] 3.2 Criar `src/navigation/RootNavigator.tsx` com `@react-navigation/native-stack`, `headerShown: false` em todas as telas, e lógica de rota inicial baseada em AsyncStorage (sessão/onboarding flag)
- [x] 3.3 Criar `src/navigation/AuthStack.tsx` com rotas: Splash, Login, RegisterStep1, RegisterStep2, RegisterStep3, OTPVerification, ForgotPassword, Biometric
- [x] 3.4 Criar `src/navigation/AppStack.tsx` com tela Home placeholder
- [x] 3.5 Configurar `<Toast />` do `react-native-toast-message` no root do `App.tsx` (fora do NavigationContainer para sobrepor telas)

## 4. Contexts — Auth e Register

- [x] 4.1 Criar `src/contexts/AuthContext.tsx` com `useReducer` para estados: `unauthenticated`, `authenticated`, `loading`
- [x] 4.2 Implementar actions: `SIGN_IN` (salva token no AsyncStorage), `SIGN_OUT` (remove token), `RESTORE_TOKEN` (verifica AsyncStorage na inicialização)
- [x] 4.3 Criar hook `useAuth()` para acesso ao contexto em qualquer componente
- [x] 4.4 Integrar `AuthProvider` no `App.tsx` envolvendo o `NavigationContainer`
- [x] 4.5 Criar `src/contexts/RegisterContext.tsx` com campos: `name`, `phone`, `email`, `password` — provider envolve apenas as rotas RegisterStep1/2/3 e OTPVerification
- [x] 4.6 Criar hook `useRegister()` para leitura/escrita no RegisterContext
- [x] 4.7 Garantir que RegisterContext é limpo (reset para valores vazios) ao sair do fluxo de cadastro — em cancelamento (← no Step1) e em conclusão (OTP verificado)

## 5. Fluxo de Onboarding

- [x] 5.1 Criar `src/screens/OnboardingScreen.tsx` com estado interno de passo atual (0, 1, 2)
- [x] 5.2 Implementar 3 slides com ícone, título e subtítulo conforme conteúdo do Figma
- [x] 5.3 Implementar dots de paginação (dot ativo 20×8px em `primary`, inativo 8×8px em `border`)
- [x] 5.4 Botão "Próximo" nas telas 1-2 avança passo; botão "Começar" na tela 3 salva flag `onboarding_completed` no AsyncStorage e navega para Splash

## 6. Splash Screen

- [x] 6.1 Criar `src/screens/SplashScreen.tsx` com logo (ícone circular + "movieApp"), subtítulo, botão "Entrar" e botão outline "Criar conta"
- [x] 6.2 Botão "Entrar" navega para Login; "Criar conta" navega para Register; link "Esqueci minha senha" navega para ForgotPassword

## 7. Tela de Login

- [x] 7.1 Criar `src/screens/LoginScreen.tsx` com layout fiel ao Figma 09-Login (logo, título, campos email/senha, link esqueci senha, botão Entrar, separador ou, botões social)
- [x] 7.2 Implementar validação: email não vazio + formato válido, senha não vazia — exibir erros em `AppInput`
- [x] 7.3 Integrar mock de API de login (retorna token simulado em sucesso, erro 401 em falha)
- [x] 7.4 Em sucesso: salvar token via `AuthContext.SIGN_IN`, exibir toast "Login realizado com sucesso!" via `react-native-toast-message` e navegar para AppStack
- [x] 7.5 Botão "Continue com Google" inicia fluxo `@react-native-google-signin/google-signin`
- [x] 7.6 Botão "Continue com Apple" inicia fluxo `@invertase/react-native-apple-authentication` (iOS apenas)
- [x] 7.7 Link "Não tem conta? Criar agora" navega para Register

## 8. Tela de Biometria

- [x] 8.1 Criar `src/screens/BiometricScreen.tsx` com layout fiel ao Figma 10-Biometria (título, subtítulo, ícone de dedo, texto "Toque no sensor", link "ou use sua senha")
- [x] 8.2 Verificar disponibilidade de biometria com `react-native-biometrics` e iniciar autenticação automática ao entrar na tela
- [x] 8.3 Em sucesso: autenticar com token salvo e navegar para AppStack
- [x] 8.4 Em falha (3 tentativas): destacar link "ou use sua senha" e ao tocar navegar para Login

## 9. Fluxo de Cadastro (3 telas separadas na stack)

- [x] 9.1 Criar componente compartilhado `src/components/RegisterProgressBar.tsx` (3 segmentos, ativo em `primary`, inativo em `border`, altura 4px) — recebe `currentStep: 1 | 2 | 3` como prop
- [x] 9.2 Criar `src/screens/RegisterStep1Screen.tsx`: campos Nome completo e Telefone com máscara "+55 (99) 99999-9999" via `react-native-mask-input`; ao "Continuar" salva no RegisterContext e navega para RegisterStep2
- [x] 9.3 Criar `src/screens/RegisterStep2Screen.tsx`: campos Email, Senha (secureTextEntry) e Confirmar senha — validar igualdade e mínimo 8 caracteres; ao "Continuar" salva no RegisterContext e navega para RegisterStep3
- [x] 9.4 Criar `src/screens/RegisterStep3Screen.tsx`: avatar circular com iniciais (do RegisterContext.name), opção "Alterar foto" (Image Picker), resumo email + telefone do RegisterContext
- [x] 9.5 Botão "Criar minha conta" no Step3 submete todos os dados do RegisterContext para mock de API e navega para OTPVerification
- [x] 9.6 Botão `←` em Step1 limpa RegisterContext e navega para Splash; em Step2/3 usa `navigation.goBack()` (stack nativa cuida do back)

## 10. Tela de Verificação OTP

- [x] 10.1 Criar `src/screens/OTPVerificationScreen.tsx` com 6 `TextInput` individuais (cada um aceita 1 dígito), foco automático avançando ao digitar
- [x] 10.2 Exibir número de telefone parcialmente mascarado no subtítulo (ex: "+55 (11) •••••-0000")
- [x] 10.3 Implementar countdown de 30 segundos para o botão "Reenviar código" (desabilitado durante contagem, ativo após)
- [x] 10.4 Botão "Verificar" habilitado somente quando todos os 6 campos preenchidos
- [x] 10.5 Em verificação OTP correta (mock): salvar token via `AuthContext.SIGN_IN` e navegar para AppStack (ou Biometric se disponível)

## 11. Tela de Recuperação de Senha

- [x] 11.1 Criar `src/screens/ForgotPasswordScreen.tsx` com layout fiel ao Figma 11-Esqueci-Senha (título, subtítulo, ícone envelope, campo email, botão enviar, link retorno)
- [x] 11.2 Validar email não vazio e formato válido antes de enviar
- [x] 11.3 Em sucesso (mock): exibir feedback "Link enviado para o seu email" e desabilitar botão por 60s
- [x] 11.4 Em erro API (qualquer): exibir mesma mensagem de sucesso (sem revelar se email cadastrado)
- [x] 11.5 Botão `←` e link "Lembrei minha senha — Entrar" navegam para Login

## 12. Smoke Test e Verificação Final

- [ ] 12.1 Testar fluxo completo no iOS Simulator: Onboarding → Splash → Cadastro (3 passos) → OTP → Home
- [ ] 12.2 Testar fluxo completo no Android Emulator: mesmas telas
- [ ] 12.3 Verificar que Nova Arquitetura está ativa: `adb shell` + check de flags, ou log de inicialização do RN
- [ ] 12.4 Verificar design system: comparar screenshots de Login e Splash com frames do Figma
- [ ] 12.5 Verificar que nenhuma lib usa Bridge legada (sem warnings de `[Deprecated]` no console)
