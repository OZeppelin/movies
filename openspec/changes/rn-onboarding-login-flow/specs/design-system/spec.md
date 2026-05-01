## ADDED Requirements

### Requirement: Tokens de cor definidos como constantes TypeScript
O sistema SHALL exportar todos os tokens de cor do Design System Figma como constantes TypeScript tipadas em `src/theme/colors.ts`.

Tokens obrigatórios:
- `primary: '#f5c142'`
- `onPrimary: '#1a1a2e'`
- `surface: '#fafafa'`
- `onSurface: '#1a1a2e'`
- `error: '#e53e3e'`
- `onError: '#ffffff'`
- `background: '#fafafa'`
- `onBackground: '#1a1a2e'`
- `placeholder: '#8c8c94'`
- `border: '#d1d1d1'`

#### Scenario: Token de cor importado corretamente
- **WHEN** qualquer componente importa `colors` de `src/theme/colors`
- **THEN** os valores hexadecimais correspondem exatamente à biblioteca Figma `movieApp-DS — Library`

---

### Requirement: Escala tipográfica definida como constantes TypeScript
O sistema SHALL exportar estilos de texto em `src/theme/typography.ts` com fonte Inter e os seguintes tamanhos/pesos:
- `titleLarge`: 28px, Bold (700)
- `titleMedium`: 22px, SemiBold (600)
- `bodyMedium`: 16px, Regular (400)
- `bodySmall`: 14px, Regular (400)
- `labelSmall`: 12px, Medium (500)

#### Scenario: Tipografia aplicada em componente de texto
- **WHEN** um componente usa `typography.titleLarge`
- **THEN** o texto renderiza com fontSize 28, fontWeight '700' e fontFamily 'Inter-Bold'

---

### Requirement: Fonte Inter bundlada localmente
O sistema SHALL incluir os arquivos de fonte Inter (Regular, Medium, SemiBold, Bold) em `assets/fonts/` e linkados via `react-native.config.js`.

#### Scenario: Fonte carrega sem erro de console
- **WHEN** o app inicia em iOS ou Android
- **THEN** nenhum erro de fonte ausente é exibido no console e o texto renderiza com Inter

---

### Requirement: Componente AppButton
O sistema SHALL fornecer um componente `AppButton` com as variantes:
- `primary`: fundo `#f5c142`, texto `#1a1a2e`, border-radius 100px, height 52px, width 100%
- `outline`: fundo branco/transparente, borda `#d1d1d1`, mesmas dimensões

#### Scenario: Botão primário renderiza corretamente
- **WHEN** `<AppButton variant="primary" label="Entrar" />` é renderizado
- **THEN** o botão exibe fundo amarelo `#f5c142`, texto `#1a1a2e` e altura 52px

#### Scenario: Botão desabilitado reduz opacidade
- **WHEN** `<AppButton disabled />` é renderizado
- **THEN** o botão exibe opacidade 0.5 e não responde a toque

---

### Requirement: Componente AppInput
O sistema SHALL fornecer um componente `AppInput` com:
- Background `#f5f5f5`, borda `#d1d1d1`, border-radius 12px, height 52px, padding horizontal 16px
- Props: `label` (texto acima), `placeholder`, `secureTextEntry`, `value`, `onChangeText`, `errorMessage`

#### Scenario: Input exibe label e placeholder
- **WHEN** `<AppInput label="Email" placeholder="usuario@email.com" />` é renderizado
- **THEN** o label aparece acima do campo e o placeholder aparece dentro

#### Scenario: Input exibe mensagem de erro
- **WHEN** `errorMessage="Campo obrigatório"` é passado ao AppInput
- **THEN** o texto de erro em cor `#e53e3e` aparece abaixo do campo e a borda muda para `#e53e3e`

---

### Requirement: Tokens de espaçamento definidos
O sistema SHALL exportar escala de espaçamento em `src/theme/spacing.ts`:
- `xs: 4`, `sm: 8`, `md: 16`, `lg: 24`, `xl: 32`, `xxl: 48`

#### Scenario: Espaçamento aplicado consistentemente
- **WHEN** qualquer tela usa `spacing.md` para padding
- **THEN** o valor 16px é aplicado uniformemente sem valores hardcoded
