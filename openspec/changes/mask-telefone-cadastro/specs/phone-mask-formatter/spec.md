## ADDED Requirements

### Requirement: Aplicar máscara de telefone durante digitação
O sistema SHALL formatar o valor do campo de telefone em tempo real enquanto o usuário digita, usando o padrão brasileiro `(XX) XXXXX-XXXX` para celular (11 dígitos) e `(XX) XXXX-XXXX` para fixo (10 dígitos). Apenas dígitos são aceitos como entrada.

#### Scenario: Usuário digita número de celular completo
- **WHEN** o usuário digita 11 dígitos numéricos no campo de telefone
- **THEN** o campo exibe o valor no formato `(XX) XXXXX-XXXX`

#### Scenario: Usuário digita número fixo completo
- **WHEN** o usuário digita 10 dígitos numéricos no campo de telefone
- **THEN** o campo exibe o valor no formato `(XX) XXXX-XXXX`

#### Scenario: Máscara progressiva durante digitação parcial
- **WHEN** o usuário digitou menos de 11 dígitos
- **THEN** a máscara é aplicada progressivamente conforme os dígitos disponíveis (`(XX)`, `(XX) XXXX`, `(XX) XXXX-XXXX`)

#### Scenario: Entrada limitada a 11 dígitos
- **WHEN** o usuário tenta digitar um 12º dígito
- **THEN** o campo ignora o caractere adicional e mantém o valor em 11 dígitos

#### Scenario: Caracteres não numéricos ignorados
- **WHEN** o usuário tenta digitar letras ou símbolos
- **THEN** apenas os dígitos são mantidos e a máscara é reaplicada

### Requirement: Hinttext descritivo no campo de telefone
O sistema SHALL exibir o hintText `'(11) 99999-0000'` no campo de telefone quando estiver vazio, indicando o formato esperado.

#### Scenario: Campo vazio exibe placeholder correto
- **WHEN** o campo de telefone está vazio e sem foco
- **THEN** o placeholder `(11) 99999-0000` é exibido
