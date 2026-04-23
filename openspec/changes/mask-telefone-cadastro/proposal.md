## Why

O campo de telefone no cadastro exibe um hintText genérico e não aplica máscara durante a digitação, prejudicando a experiência do usuário e dificultando a validação visual do número. A separação entre dado formatado (exibição) e dado limpo (persistência) precisa ser explícita.

## What Changes

- Alterar o `hintText` do campo telefone de `'+55 (11) 99999-0000'` para `'(11) 99999-0000'`
- Adicionar um `TextInputFormatter` customizado que aplica a máscara `(XX) XXXXX-XXXX` (celular) ou `(XX) XXXX-XXXX` (fixo) conforme o usuário digita
- Antes de chamar `viewModel.saveStep1()`, extrair apenas os dígitos do valor mascarado e passá-los ao ViewModel
- O banco de dados continua recebendo apenas os dígitos (sem máscara)

## Capabilities

### New Capabilities

- `phone-mask-formatter`: Formatador de máscara de telefone brasileiro `(XX) XXXXX-XXXX` / `(XX) XXXX-XXXX` aplicado durante a digitação no campo de cadastro

### Modified Capabilities

- `criar-conta-flow`: O campo de telefone passa a formatar entrada em tempo real e a transmitir somente dígitos ao ViewModel

## Impact

- `lib/views/screens/criar_conta_step1_screen.dart` — adicionar formatter e strip de máscara no submit
- `lib/viewmodels/user_view_model.dart` — `saveStep1` recebe dígitos puros (sem alteração na assinatura, só no dado enviado)
- Nenhuma dependência nova de package necessária (formatter customizado em Dart puro)
