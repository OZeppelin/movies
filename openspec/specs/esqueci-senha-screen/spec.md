# Spec: Esqueci Senha Screen

## Purpose

TBD — Definir os requisitos visuais e funcionais da tela de recuperação de senha (`EsqueciSenhaScreen`) do movieApp, incluindo layout, campo de email e ações disponíveis ao usuário.

## Requirements

### Requirement: Tela Esqueci Senha exibe layout de recuperação
A `EsqueciSenhaScreen` SHALL exibir, sobre fundo branco: botão voltar `←` no canto superior esquerdo, título "Recuperar senha" (Inter Bold 26px, `#1A1A2E`), subtítulo explicativo (Inter Regular 15px, `#8C8C94`), e ícone ✉ em círculo amarelo (`#F5C142`, 80×80px), conforme o design Figma `11-Esqueci-Senha`.

#### Scenario: Elementos visuais presentes
- **WHEN** a `EsqueciSenhaScreen` é renderizada
- **THEN** SHALL exibir botão voltar `←` no topo esquerdo
- **THEN** SHALL exibir o título "Recuperar senha" em Inter Bold 26px `#1A1A2E`
- **THEN** SHALL exibir o subtítulo "Informe seu email e enviaremos um link de redefinição." em `#8C8C94`
- **THEN** SHALL exibir um círculo amarelo `#F5C142` de 80×80px com ícone ✉ centralizado

#### Scenario: Fundo da tela
- **WHEN** a `EsqueciSenhaScreen` é renderizada
- **THEN** o fundo da tela SHALL ser branco (`#FFFFFF`)

### Requirement: Campo de email estilizado
A `EsqueciSenhaScreen` SHALL exibir um campo de texto para email com label "Email" (Inter SemiBold 12px, `#1A1A2E`), fundo `#F5F5F5`, borda `#D1D1D1`, border-radius 12px, altura 52px, placeholder "usuario@email.com" em `#8C8C94` 14px.

#### Scenario: Campo de email presente e editável
- **WHEN** a `EsqueciSenhaScreen` é renderizada
- **THEN** SHALL existir um campo de texto com label "Email" acima
- **THEN** o campo SHALL ter fundo `#F5F5F5`, borda `#D1D1D1`, border-radius 12px e altura 52px
- **WHEN** o usuário toca no campo
- **THEN** o teclado SHALL abrir com tipo `emailAddress`

### Requirement: Ações da tela de recuperação
A `EsqueciSenhaScreen` SHALL delegar toda lógica de validação e envio ao `EsqueciSenhaViewModel`, exibindo o botão "Enviar link de recuperação" (fundo `#F5C142`, pill, 52px, full width) e o link "Lembrei minha senha — Entrar" na parte inferior. O botão SHALL estar desabilitado enquanto `viewModel.isLoading == true`.

#### Scenario: Botão de envio presente
- **WHEN** a `EsqueciSenhaScreen` é renderizada
- **THEN** SHALL existir botão "Enviar link de recuperação" com fundo `#F5C142`, texto `#1A1A2E`, pill shape, largura total menos 48px

#### Scenario: Botão desabilitado durante loading
- **WHEN** `viewModel.isLoading == true`
- **THEN** o botão "Enviar link de recuperação" SHALL exibir `CircularProgressIndicator` e SHALL estar desabilitado

#### Scenario: Link de volta para login
- **WHEN** o usuário toca em "Lembrei minha senha — Entrar"
- **THEN** a tela SHALL fechar (`Navigator.pop`) retornando para a tela anterior

#### Scenario: Botão voltar fecha a tela
- **WHEN** o usuário toca no botão `←`
- **THEN** a tela SHALL fechar (`Navigator.pop`) retornando para a tela anterior

### Requirement: EsqueciSenhaScreen é View pura (UI + navegação)
A `EsqueciSenhaScreen` SHALL conter apenas construção de UI e lógica de navegação, sem lógica de validação ou chamadas Firebase diretas. Toda lógica SHALL residir no `EsqueciSenhaViewModel`.

#### Scenario: View reage a errorMessage
- **WHEN** `viewModel.errorMessage != null` após operação
- **THEN** a View SHALL exibir `SnackBar` com o texto de `errorMessage`
- **THEN** a View SHALL chamar `viewModel.clearError()` após exibir

#### Scenario: View reage a envio bem-sucedido
- **WHEN** `viewModel.enviarLinkRecuperacao` retorna `true`
- **THEN** a View SHALL exibir `SnackBar` com "Link enviado! Verifique seu email."
- **THEN** após exibição SHALL chamar `Navigator.pop`

#### Scenario: View delega ação do botão ao ViewModel
- **WHEN** o usuário toca em "Enviar link de recuperação"
- **THEN** a View SHALL chamar `viewModel.enviarLinkRecuperacao(emailController.text)`
- **THEN** NÃO SHALL conter lógica de validação ou Firebase na View
