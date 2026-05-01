## ADDED Requirements

### Requirement: Estrutura de navegação RootStack
O sistema SHALL implementar o `RootStack` usando `@react-navigation/native-stack` com as seguintes rotas:

```
RootStack
  ├── Onboarding      (top-level; exibida se flag onboarding_completed ausente)
  ├── AuthStack
  │   ├── Splash
  │   ├── Login
  │   ├── RegisterStep1
  │   ├── RegisterStep2
  │   ├── RegisterStep3
  │   ├── OTPVerification
  │   ├── ForgotPassword
  │   └── Biometric
  └── AppStack
      └── Home        (placeholder para conteúdo futuro)
```

Onboarding é tutorial de produto, não parte do fluxo de autenticação. Por isso vive no RootStack diretamente, não dentro do AuthStack.

#### Scenario: App sem sessão inicia no fluxo de autenticação
- **WHEN** AsyncStorage não contém token de sessão válido
- **THEN** app exibe Splash ou Onboarding (dependendo da flag)

#### Scenario: App com sessão válida inicia no AppStack
- **WHEN** AsyncStorage contém token de sessão válido
- **THEN** app navega diretamente para AppStack sem exibir telas de autenticação

---

### Requirement: Transições de tela sem header nativo
O sistema SHALL configurar `headerShown: false` em todas as telas do fluxo de autenticação para controle total do layout por cada tela.

#### Scenario: Telas de auth não exibem header nativo
- **WHEN** qualquer tela do AuthStack é renderizada
- **THEN** nenhuma barra de navegação nativa é visível no topo

---

### Requirement: Tipagem TypeScript das rotas
O sistema SHALL definir tipos TypeScript para todos os parâmetros de rota no arquivo `src/navigation/types.ts`. O `RootStackParamList` MUST incluir rotas: `Onboarding`, `Splash`, `Login`, `RegisterStep1`, `RegisterStep2`, `RegisterStep3`, `OTPVerification`, `ForgotPassword`, `Biometric`, `Home`.

#### Scenario: Navegação tipada previne erros em tempo de desenvolvimento
- **WHEN** desenvolvedor usa `navigation.navigate('RegisterStep2')`
- **THEN** TypeScript verifica que a rota existe no `RootStackParamList` e que os params estão corretos

---

### Requirement: Comportamento do botão físico voltar (Android)
O sistema SHALL tratar o botão físico voltar do Android corretamente em cada tela.

#### Scenario: Botão voltar na tela Splash encerra o app
- **WHEN** usuário pressiona o botão físico voltar na tela Splash
- **THEN** o app é encerrado (comportamento padrão sem tela anterior)

#### Scenario: Botão voltar no Login retorna para Splash
- **WHEN** usuário pressiona o botão físico voltar na tela Login
- **THEN** app navega para Splash

#### Scenario: Botão voltar no RegisterStep2 retorna ao RegisterStep1
- **WHEN** usuário pressiona o botão físico voltar na tela RegisterStep2
- **THEN** RegisterStep1 é exibida e dados do RegisterContext (name, phone) estão preservados

#### Scenario: Botão voltar no RegisterStep3 retorna ao RegisterStep2
- **WHEN** usuário pressiona o botão físico voltar na tela RegisterStep3
- **THEN** RegisterStep2 é exibida e dados do RegisterContext (email, password) estão preservados
