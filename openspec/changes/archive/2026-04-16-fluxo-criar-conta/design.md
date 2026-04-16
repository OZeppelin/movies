## Context

O projeto já tem `SplashScreen` (com `onRegister` callback), `AppColors`, Firebase Core configurado e o padrão `StatefulWidget` + `TextEditingController` estabelecido em `EsqueciSenhaScreen`. O `main.dart` passa `onForgotPassword` para `SplashScreen`; `onRegister` está presente mas ainda nulo.

O fluxo de 3 passos passa dados entre telas via parâmetros do construtor (nome, telefone, email para Step3). Não há ViewModel — estado de formulário é gerenciado com `TextEditingController` e `setState` local.

## Goals / Non-Goals

**Goals:**
- 3 telas `StatefulWidget` com `TextEditingController` para campos de formulário
- Progress bar de 3 segmentos em cada tela (ativos/inativos conforme o passo)
- Navegação: SplashScreen → Step1 → Step2 → Step3 via `Navigator.push`
- Step3 chama `FirebaseAuth.instance.createUserWithEmailAndPassword`
- Após criação bem-sucedida, pop até SplashScreen via `Navigator.popUntil`
- Avatar com iniciais no Step3 derivado do nome digitado no Step1
- Validação básica: campos obrigatórios e senha == confirmar senha no Step2

**Non-Goals:**
- Upload de foto de perfil (tela 3 mostra "Alterar foto (opcional)" como texto sem ação)
- Salvar dados no Firestore (apenas Firebase Auth)
- Tratamento de erros de rede (além de snackbar genérico)
- Internacionalização

## Decisions

### 1. 3 telas separadas com Navigator.push (não PageView)

**Decisão**: Cada passo é uma tela independente navegada com `Navigator.push`.

**Rationale**: Os 3 passos têm formulários distintos, validações independentes, e o botão ← do sistema deve retroceder ao passo anterior. `PageView` impediria o back nativo e complicaria a validação por passo. `Navigator.push` é o padrão Flutter para fluxos multi-step com back natural.

**Alternativa considerada**: `PageView` com índice — descartado porque o botão ← do sistema não funcionaria para voltar de passo.

### 2. Passagem de dados via parâmetros do construtor

**Decisão**: Step2 recebe `nome` e `telefone` de Step1; Step3 recebe `nome`, `telefone` e `email` de Step2.

**Rationale**: O estado do formulário é efêmero e pertence ao fluxo de criação. Usar parâmetros do construtor é simples, type-safe e não requer Provider/InheritedWidget para esse volume de dados. Step3 exibe o resumo dos dados coletados.

**Alternativa considerada**: Objeto de modelo compartilhado via Provider — desnecessário para 4 campos.

### 3. StatefulWidget com TextEditingController (sem ViewModel)

**Decisão**: Cada tela é `StatefulWidget` com seus `TextEditingController`s gerenciados no `State`.

**Rationale**: O padrão já estabelecido em `EsqueciSenhaScreen`. Estado puramente de UI (formulário), sem lógica de negócio compartilhada. Não justifica ViewModel separado.

### 4. Firebase Auth direto no Step3

**Decisão**: `FirebaseAuth.instance.createUserWithEmailAndPassword` chamado no `onPressed` do botão "Criar minha conta" no Step3, com `setState` para loading e try/catch para erros.

**Rationale**: Lógica simples de uma chamada. Colocar em ViewModel separado seria premature abstraction para MVP.

### 5. Progress bar com Row de Containers (sem assets)

**Decisão**: 3 `Container`s 105×4px com `BorderRadius.circular(2)`, cor ativa `AppColors.primary`, inativa `AppColors.inputBorder`, espaçados com `SizedBox(width: 6)`.

**Rationale**: Formas geométricas simples sem necessidade de imagens. Cada tela hardcoda quantas barras são ativas (1, 2 ou 3), sem animação de transição.

### 6. Avatar com iniciais no Step3

**Decisão**: Círculo 80×80px `AppColors.primary` com as iniciais do nome (primeiras letras das 2 primeiras palavras) em texto Bold 28px `AppColors.dark`. Sem interação real (foto).

**Rationale**: O Figma mostra um círculo amarelo com "MV". O texto "Alterar foto (opcional)" abaixo fica como texto inativo (sem `onTap`) para MVP.

### 7. Após criação bem-sucedida: popUntil SplashScreen

**Decisão**: `Navigator.popUntil((route) => route.isFirst)` após sucesso do Firebase Auth.

**Rationale**: Remove Step1, Step2, Step3 da pilha e retorna à SplashScreen. O usuário vê a tela inicial limpa. Não há tela "home" implementada ainda.

## Risks / Trade-offs

- **Sem validação de telefone**: O campo aceita qualquer string. Mitigação: aceitável para MVP.
- **Senha sem requisitos mínimos**: Firebase rejeitará senhas < 6 chars com erro — o `try/catch` exibirá `ScaffoldMessenger` com a mensagem de erro.
- **Dados não persistidos além do Auth**: Nome e telefone digitados não ficam no Firestore. Mitigação: escopo do MVP é só autenticação.
