## ADDED Requirements

### Requirement: Splash Screen com animação de entrada
O sistema SHALL exibir a Splash Screen como primeira tela ao abrir o app, contendo:
- Ícone circular da app (clapperboard 🎬) centralizado
- Título "movieApp" (tipografia `titleLarge`, `onBackground`)
- Subtítulo "Seu cinema na palma da mão" (`bodyMedium`, `placeholder`)
- Botão primário "Entrar" que navega para Login
- Botão outline "Criar conta" que navega para Register
- Link "Esqueci minha senha" que navega para ForgotPassword

#### Scenario: Primeiro acesso exibe Splash
- **WHEN** o app é aberto pela primeira vez (sem sessão salva)
- **THEN** a Splash Screen é exibida como tela inicial

#### Scenario: Sessão ativa pula Splash
- **WHEN** o app é aberto com token de sessão válido no AsyncStorage
- **THEN** o app navega diretamente para AppStack (home), pulando Splash e Onboarding

---

### Requirement: Fluxo de Onboarding com 3 telas
O sistema SHALL exibir 3 telas de onboarding sequenciais (apenas na primeira vez que o app é instalado) com:
- Imagem/ícone de destaque na parte superior (altura 380px)
- Título e subtítulo no terço inferior
- Dots de paginação indicando tela atual (dot ativo: 20×8px, inativo: 8×8px)
- Botão "Próximo" nas telas 1 e 2; "Começar" na tela 3

Conteúdo:
- Tela 1: 🎬 "Descubra filmes incríveis" / "Explore milhares de títulos, trailers e resenhas."
- Tela 2: ⭐ "Avalie e crie sua watchlist" / "Salve o que quer assistir e compartilhe suas notas."
- Tela 3: 🍿 "Tudo pronto para começar" / "Crie sua conta e comece a explorar agora mesmo."

#### Scenario: Navegar de Onboarding 1 para 2
- **WHEN** usuário toca "Próximo" na tela 1 do onboarding
- **THEN** a tela 2 é exibida e o segundo dot fica ativo

#### Scenario: Tela 3 exibe botão "Começar"
- **WHEN** usuário chega na tela 3 do onboarding
- **THEN** o botão exibe "Começar" e ao tocá-lo navega para a Splash (ou Login)

#### Scenario: Onboarding não reexibido após conclusão
- **WHEN** usuário completa o onboarding (toca "Começar")
- **THEN** flag `onboarding_completed: true` é salva no AsyncStorage e nas próximas aberturas o onboarding não é exibido

---

### Requirement: Persistência do estado de onboarding
O sistema SHALL verificar o AsyncStorage na inicialização para determinar se o onboarding já foi exibido.

#### Scenario: Flag ausente exibe onboarding
- **WHEN** chave `onboarding_completed` não existe no AsyncStorage
- **THEN** o fluxo de onboarding é exibido antes da Splash

#### Scenario: Flag presente pula onboarding
- **WHEN** chave `onboarding_completed` existe com valor `true`
- **THEN** o fluxo inicia diretamente na Splash Screen
