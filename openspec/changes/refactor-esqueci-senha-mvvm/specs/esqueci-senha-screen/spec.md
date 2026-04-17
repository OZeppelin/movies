## MODIFIED Requirements

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
