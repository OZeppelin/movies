## Why

Os campos de texto (TextField) nas telas do Login Flow estão com largura reduzida, ocupando menos que a largura disponível da tela. Isso prejudica a usabilidade em dispositivos mobile, onde campos estreitos dificultam a digitação e criam desequilíbrio visual em relação aos botões que já usam a largura total.

## What Changes

- Ajustar a largura de todos os frames de Input nas 8 telas afetadas para ocupar a largura total disponível (`W - 48`, onde `W = 375px`, resultando em `327px`)
- As telas afetadas são: `05-Cadastro-Step1`, `06-Cadastro-Step2`, `07-Cadastro-Step3`, `08-OTP` (boxes), `09-Login`, `11-Esqueci-Senha`

## Capabilities

### New Capabilities

### Modified Capabilities

- `login-flow`: Os requisitos de layout dos campos de input passam a exigir largura consistente de `W - 48px` em todas as telas do fluxo de autenticação.

## Impact

- **Figma** — arquivo `movieApp DS — Login Flow` (`lT8Jhe8Q1HzH7yWgjFCUBh`): resize nos frames de Input em 6 telas
- Sem impacto em código Flutter (ainda não implementado)
- Sem impacto na Library (`movieApp DS — Library`)
