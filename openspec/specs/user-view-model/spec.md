# Spec: User View Model

## Purpose

TBD

## Requirements

### Requirement: UserViewModel acumula dados do fluxo de criação de conta em memória
`UserViewModel` SHALL estender `BaseViewModel` e manter em memória os campos `_name`, `_numberPhone`, `_email`, `_password` via métodos `saveStep1(String name, String numberPhone)` e `saveStep2(String email, String password)`.

#### Scenario: Acumulação de dados do Step1
- **WHEN** `saveStep1(name, numberPhone)` é chamado
- **THEN** `UserViewModel` SHALL armazenar internamente `name` e `numberPhone`
- **THEN** NÃO SHALL chamar `notifyListeners()`

#### Scenario: Acumulação de dados do Step2
- **WHEN** `saveStep2(email, password)` é chamado
- **THEN** `UserViewModel` SHALL armazenar internamente `email` e `password`
- **THEN** NÃO SHALL chamar `notifyListeners()`

### Requirement: UserViewModel valida campos do Step1
`bool validateStep1(String name, String numberPhone)` SHALL retornar `false` e setar `errorMessage` se nome for vazio ou telefone tiver menos de 10 dígitos (extraindo apenas dígitos do valor fornecido).

#### Scenario: Nome vazio
- **WHEN** `validateStep1` é chamado com nome vazio ou só espaços
- **THEN** SHALL setar `errorMessage` com "Preencha o nome completo"
- **THEN** SHALL retornar `false`

#### Scenario: Telefone com poucos dígitos
- **WHEN** `validateStep1` é chamado com telefone com menos de 10 dígitos
- **THEN** SHALL setar `errorMessage` com "Telefone inválido"
- **THEN** SHALL retornar `false`

#### Scenario: Step1 válido
- **WHEN** `validateStep1` é chamado com nome não vazio e telefone com 10+ dígitos
- **THEN** SHALL retornar `true`
- **THEN** `errorMessage` SHALL ser `null`

### Requirement: UserViewModel valida campos do Step2
`bool validateStep2(String email, String password, String confirmPassword)` SHALL validar formato de email (regex), senha mínimo 6 caracteres, e confirmação igual à senha.

#### Scenario: Email com formato inválido
- **WHEN** `validateStep2` é chamado com email sem formato válido
- **THEN** SHALL setar `errorMessage` com "Informe um email válido"
- **THEN** SHALL retornar `false`

#### Scenario: Senha com menos de 6 caracteres
- **WHEN** `validateStep2` é chamado com senha com menos de 6 caracteres
- **THEN** SHALL setar `errorMessage` com "A senha deve ter pelo menos 6 caracteres"
- **THEN** SHALL retornar `false`

#### Scenario: Confirmação de senha divergente
- **WHEN** `validateStep2` é chamado com `password != confirmPassword`
- **THEN** SHALL setar `errorMessage` com "As senhas não coincidem"
- **THEN** SHALL retornar `false`

#### Scenario: Step2 válido
- **WHEN** `validateStep2` é chamado com email válido, senha com 6+ chars e confirmação igual
- **THEN** SHALL retornar `true`
- **THEN** `errorMessage` SHALL ser `null`

### Requirement: UserViewModel cria usuário via UserService e FirebaseAuth
`Future<bool> createUser()` SHALL obter o UDID do device via `UserService.getDeviceId()`, montar um `UserModel` com todos os dados acumulados, chamar `FirebaseAuth.instance.createUserWithEmailAndPassword` e em seguida `UserService.createUser(model)`.

#### Scenario: Criação bem-sucedida
- **WHEN** `createUser()` é chamado com todos os dados preenchidos via saveStep1/saveStep2
- **THEN** SHALL chamar `setLoading(true)`
- **THEN** SHALL obter device ID via `UserService.getDeviceId()`
- **THEN** SHALL chamar `FirebaseAuth.instance.createUserWithEmailAndPassword`
- **THEN** SHALL chamar `UserService.createUser(userModel)`
- **THEN** em sucesso SHALL chamar `setLoading(false)` e retornar `true`

#### Scenario: Erro FirebaseAuth na criação
- **WHEN** `FirebaseAuth` lança `FirebaseAuthException`
- **THEN** SHALL setar `errorMessage` com a mensagem do erro
- **THEN** SHALL chamar `setLoading(false)` e retornar `false`
- **THEN** NÃO SHALL chamar `UserService.createUser`

### Requirement: UserViewModel expõe errorMessage e clearError
`UserViewModel` SHALL expor `String? errorMessage` com getter público e `clearError()` que seta para `null` e chama `notifyListeners()`.

#### Scenario: clearError limpa o estado de erro
- **WHEN** `clearError()` é chamado após um erro ter sido setado
- **THEN** `errorMessage` SHALL ser `null`
- **THEN** SHALL chamar `notifyListeners()`
