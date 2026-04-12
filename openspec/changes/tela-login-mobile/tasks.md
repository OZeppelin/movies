## 1. Configuração e Dependências

- [ ] 1.1 Instalar e configurar Firebase Authentication SDK no projeto (`@react-native-firebase/auth`)
- [ ] 1.2 Instalar `react-native-keychain` para armazenamento seguro do token de sessão
- [ ] 1.3 Adicionar `google-services.json` (Android) e `GoogleService-Info.plist` (iOS) ao projeto
- [ ] 1.4 Configurar SHA-1 do app no Firebase Console para habilitar OAuth com Google
- [ ] 1.5 Instalar e configurar `@react-native-google-signin/google-signin` para autenticação OAuth

## 2. Arquitetura de Autenticação

- [ ] 2.1 Criar `AuthContext` e `AuthProvider` com `useReducer` (estados: `idle | loading | authenticated | error`)
- [ ] 2.2 Criar `AuthService` com métodos: `signInWithEmail()`, `signInWithGoogle()`, `signOut()`, `getStoredToken()`
- [ ] 2.3 Implementar persistência segura do token via `react-native-keychain` dentro do `AuthService`
- [ ] 2.4 Configurar listener de estado do Firebase (`onAuthStateChanged`) no `AuthProvider`
- [ ] 2.5 Adicionar lógica de redirecionamento: se token válido na inicialização → `MovieListScreen`

## 3. Navegação

- [ ] 3.1 Criar stack de navegação de autenticação (`AuthStack`) com a rota `LoginScreen`
- [ ] 3.2 Criar stack de navegação principal (`AppStack`) com as rotas autenticadas existentes
- [ ] 3.3 Configurar `RootNavigator` para alternar entre `AuthStack` e `AppStack` com base no estado do `AuthContext`
- [ ] 3.4 Garantir que o login use `navigation.replace()` ao redirecionar para `MovieListScreen`

## 4. Tela de Login — Layout e Design System

- [ ] 4.1 Criar arquivo `LoginScreen.tsx` com o container principal (fundo `#0D0D0D`, safe area)
- [ ] 4.2 Implementar seção de header com logo, título "Em Cartaz" e subtítulo "Filmes & Sessões"
- [ ] 4.3 Implementar campo de e-mail com fundo `#1A1A1A`, ícone de envelope, borda verde neon ao focar e teclado `email-address`
- [ ] 4.4 Implementar campo de senha com fundo `#1A1A1A`, ícone de cadeado, toggle de visibilidade e `secureTextEntry`
- [ ] 4.5 Implementar link "Esqueci minha senha" alinhado à direita em `#00E676`
- [ ] 4.6 Implementar botão "Entrar" com fundo `#00E676`, texto bold `#0D0D0D`, border-radius 14px e largura total
- [ ] 4.7 Implementar divisor "ou" e botão "Entrar com Google" com fundo `#1A1A1A` e ícone do Google
- [ ] 4.8 Garantir scroll automático ao abrir o teclado para manter campos visíveis (`KeyboardAvoidingView`)

## 5. Validação de Formulário

- [ ] 5.1 Implementar validação de e-mail on blur (verificar formato com regex `^[^\s@]+@[^\s@]+\.[^\s@]+$`)
- [ ] 5.2 Implementar validação de senha on blur (mínimo 6 caracteres)
- [ ] 5.3 Exibir mensagens de erro em `#FF6B6B` abaixo de cada campo com borda vermelha
- [ ] 5.4 Desabilitar botão "Entrar" (opacity 0.4, não interativo) quando campos inválidos ou vazios
- [ ] 5.5 Executar validação completa dos dois campos on submit antes de disparar a requisição

## 6. Fluxo de Autenticação

- [ ] 6.1 Conectar botão "Entrar" ao `AuthService.signInWithEmail()` e atualizar estado do `AuthContext`
- [ ] 6.2 Exibir spinner de loading no botão e desabilitar campos durante a requisição
- [ ] 6.3 Tratar erro 401 (credenciais inválidas): exibir mensagem de erro e limpar campo de senha
- [ ] 6.4 Tratar erro de rede/timeout: exibir mensagem de erro de conexão em `#FF6B6B`
- [ ] 6.5 Conectar botão "Entrar com Google" ao `AuthService.signInWithGoogle()` via `react-native-google-signin`
- [ ] 6.6 Tratar cancelamento do OAuth Google (usuário fecha o fluxo sem autorizar)

## 7. Acessibilidade

- [ ] 7.1 Configurar `returnKeyType="next"` no campo de e-mail para mover foco ao campo de senha
- [ ] 7.2 Configurar `returnKeyType="done"` no campo de senha para submeter o formulário
- [ ] 7.3 Adicionar `accessibilityLabel` nos botões e campos para leitores de tela

## 8. Testes

- [ ] 8.1 Escrever testes unitários para `AuthService` (mock do Firebase e Keychain)
- [ ] 8.2 Escrever testes de validação dos campos (e-mail inválido, senha curta, campos vazios)
- [ ] 8.3 Escrever testes do `AuthContext` (transições de estado: idle → loading → authenticated/error)
- [ ] 8.4 Testar fluxo completo de login e-mail/senha em dispositivo físico (iOS e Android)
- [ ] 8.5 Testar fluxo OAuth Google em dispositivo físico
- [ ] 8.6 Testar persistência de sessão: fechar e reabrir o app com token válido armazenado
