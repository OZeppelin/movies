## MODIFIED Requirements

### Requirement: CriarContaStep1Screen valida campos antes de avançar
A `CriarContaStep1Screen` SHALL usar `ChangeNotifierProvider<UserViewModel>` e delegar a validação de nome e telefone ao ViewModel antes de navegar para o Step2.

#### Scenario: Navegação com campos válidos
- **WHEN** o usuário toca "Continuar" com nome e telefone válidos
- **THEN** `viewModel.validateStep1` SHALL retornar `true`
- **THEN** SHALL chamar `viewModel.saveStep1(name, numberPhone)`
- **THEN** SHALL navegar para `CriarContaStep2Screen` passando o `viewModel`

#### Scenario: Navegação bloqueada com campos inválidos
- **WHEN** o usuário toca "Continuar" com nome vazio ou telefone inválido
- **THEN** `viewModel.validateStep1` SHALL retornar `false`
- **THEN** a View SHALL exibir `SnackBar` com `viewModel.errorMessage`
- **THEN** SHALL chamar `viewModel.clearError()`
- **THEN** NÃO SHALL navegar para o Step2

### Requirement: CriarContaStep2Screen valida campos via ViewModel
A `CriarContaStep2Screen` SHALL receber `UserViewModel` via construtor e delegar todas as validações de email, senha e confirmação ao ViewModel, removendo qualquer lógica de validação da View.

#### Scenario: Navegação com campos válidos
- **WHEN** o usuário toca "Continuar" com email, senha e confirmação válidos
- **THEN** `viewModel.validateStep2` SHALL retornar `true`
- **THEN** SHALL chamar `viewModel.saveStep2(email, password)`
- **THEN** SHALL navegar para `CriarContaStep3Screen` passando o `viewModel`

#### Scenario: Navegação bloqueada com campos inválidos
- **WHEN** o usuário toca "Continuar" com qualquer campo inválido
- **THEN** `viewModel.validateStep2` SHALL retornar `false`
- **THEN** a View SHALL exibir `SnackBar` com `viewModel.errorMessage`
- **THEN** SHALL chamar `viewModel.clearError()`
- **THEN** NÃO SHALL navegar para o Step3

### Requirement: CriarContaStep3Screen cria conta via UserViewModel
A `CriarContaStep3Screen` SHALL receber `UserViewModel` via construtor, remover import de `firebase_auth` e substituir `_criarConta()` por `viewModel.createUser()`.

#### Scenario: Criação de conta bem-sucedida
- **WHEN** o usuário toca "Criar minha conta" e `viewModel.createUser()` retorna `true`
- **THEN** a View SHALL executar `Navigator.popUntil((r) => r.isFirst)`

#### Scenario: Erro na criação de conta
- **WHEN** `viewModel.createUser()` retorna `false`
- **THEN** a View SHALL exibir `SnackBar` com `viewModel.errorMessage`
- **THEN** SHALL chamar `viewModel.clearError()`

#### Scenario: Loading state no botão
- **WHEN** `viewModel.isLoading == true`
- **THEN** o botão "Criar minha conta" SHALL exibir `CircularProgressIndicator` e estar desabilitado
