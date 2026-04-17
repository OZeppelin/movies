## ADDED Requirements

### Requirement: EsqueciSenhaViewModel encapsula validação e envio de link de recuperação
O `EsqueciSenhaViewModel` SHALL estender `BaseViewModel` e encapsular a validação do campo email e o envio do link de recuperação via `FirebaseAuth.instance.sendPasswordResetEmail`, expondo resultados via retorno `bool` e `errorMessage`.

#### Scenario: Validação de campo email vazio
- **WHEN** `enviarLinkRecuperacao` é chamado com email vazio (`""`)
- **THEN** o ViewModel SHALL setar `errorMessage` com "Preencha o campo de email"
- **THEN** SHALL chamar `notifyListeners()`
- **THEN** SHALL retornar `false`
- **THEN** NÃO SHALL chamar `FirebaseAuth`

#### Scenario: Validação de formato de email inválido
- **WHEN** `enviarLinkRecuperacao` é chamado com email sem formato válido (ex: `"abc"`, `"abc@"`, `"@foo.com"`)
- **THEN** o ViewModel SHALL setar `errorMessage` com "Informe um email válido"
- **THEN** SHALL chamar `notifyListeners()`
- **THEN** SHALL retornar `false`
- **THEN** NÃO SHALL chamar `FirebaseAuth`

#### Scenario: Envio bem-sucedido
- **WHEN** `enviarLinkRecuperacao` é chamado com email de formato válido
- **THEN** SHALL chamar `setLoading(true)`
- **THEN** SHALL chamar `FirebaseAuth.instance.sendPasswordResetEmail(email: email)`
- **THEN** em sucesso SHALL chamar `setLoading(false)` e retornar `true`
- **THEN** `errorMessage` SHALL ser `null`

#### Scenario: Erro Firebase no envio
- **WHEN** `FirebaseAuth` lança `FirebaseAuthException` durante `sendPasswordResetEmail`
- **THEN** o ViewModel SHALL setar `errorMessage` com a mensagem do erro
- **THEN** SHALL chamar `notifyListeners()` e `setLoading(false)`
- **THEN** SHALL retornar `false`

### Requirement: EsqueciSenhaViewModel expõe errorMessage e clearError
O `EsqueciSenhaViewModel` SHALL expor `String? errorMessage` com getter público e método `clearError()` que seta `errorMessage` para `null` e chama `notifyListeners()`.

#### Scenario: clearError limpa a mensagem de erro
- **WHEN** `clearError()` é chamado após `errorMessage` ter sido setado
- **THEN** `errorMessage` SHALL ser `null`
- **THEN** SHALL chamar `notifyListeners()`
