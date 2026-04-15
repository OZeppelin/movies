## Context

A `SplashScreen` já expõe o callback `onForgotPassword` mas ele nunca é passado no `main.dart`. Esta mudança conecta esse callback com uma navegação real para a `EsqueciSenhaScreen`, que implementa o design `11-Esqueci-Senha` do Figma.

O design tem fundo branco (não `#FAFAFA` como a Splash), campo de e-mail estilizado e dois elementos de ação: botão primário de envio e link de volta para login.

## Goals / Non-Goals

**Goals:**
- Implementar a `EsqueciSenhaScreen` com fidelidade ao design `11-Esqueci-Senha`
- Conectar o `onForgotPassword` da `SplashScreen` via `Navigator.push`
- Botão voltar (`←`) e link "Lembrei minha senha" ambos fecham a tela (`Navigator.pop`)
- Adicionar constantes de cor faltantes em `AppColors` (`inputBackground`, `inputBorder`)

**Non-Goals:**
- Implementar lógica real de envio de e-mail (Firebase Auth `sendPasswordResetEmail`)
- Validação de formato de e-mail
- Feedback de sucesso/erro após envio
- Teclado dismiss ao tocar fora do campo

## Decisions

### 1. Navegação com `Navigator.push` (não named routes)

**Decisão**: Usar `Navigator.push(context, MaterialPageRoute(...))` direto no `onForgotPassword` do `main.dart`.

**Rationale**: O projeto ainda não tem um sistema de rotas nomeadas. Introduzir `routes` no `MaterialApp` só para esta tela seria over-engineering. A navegação imperativa é suficiente e direta.

### 2. EsqueciSenhaScreen como StatefulWidget (campo de texto)

**Decisão**: Usar `StatefulWidget` com um `TextEditingController` para o campo de email.

**Rationale**: Diferente da `SplashScreen`, esta tela tem estado (o conteúdo do campo de email). `StatefulWidget` é a abordagem idiomática do Flutter para formulários simples sem ViewModel.

**Alternativa considerada**: `StatelessWidget` com callback — descartado pois o estado do campo precisa ser acessível para o botão de envio.

### 3. Campo de email como TextField estilizado (não TextFormField)

**Decisão**: Usar `TextField` com `InputDecoration` customizado para reproduzir o design do Figma (radius 12px, fundo `#F5F5F5`, borda `#D1D1D1`).

**Rationale**: Não há formulário com validação nesta fase — `TextField` é mais simples que `TextFormField` para o caso de uso atual.

### 4. Novas cores adicionadas ao AppColors

**Decisão**: Adicionar `AppColors.white`, `AppColors.inputBackground` (`#F5F5F5`) e `AppColors.inputBorder` (`#D1D1D1`).

**Rationale**: Estas cores são usadas nesta tela e provavelmente em outras telas de formulário do fluxo de login. Centralizá-las agora evita repetição.

## Risks / Trade-offs

- **Botão de envio sem ação real** → O botão "Enviar link de recuperação" não faz nada nesta fase. Mitigação: documentado como comportamento intencional até a implementação do Firebase Auth.
- **Campo de email sem validação** → O usuário pode enviar campo vazio. Mitigação: aceitável para MVP visual; validação será adicionada junto com a lógica de envio.
