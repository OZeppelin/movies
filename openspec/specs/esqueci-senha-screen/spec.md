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
A `EsqueciSenhaScreen` SHALL exibir o botão "Enviar link de recuperação" (fundo `#F5C142`, pill, 52px, full width) e o link "Lembrei minha senha — Entrar" (Inter Regular 13px, `#8C8C94`, centralizado) na parte inferior.

#### Scenario: Botão de envio presente
- **WHEN** a `EsqueciSenhaScreen` é renderizada
- **THEN** SHALL existir botão "Enviar link de recuperação" com fundo `#F5C142`, `#1A1A2E` text, pill shape, largura total menos 48px

#### Scenario: Link de volta para login
- **WHEN** o usuário toca em "Lembrei minha senha — Entrar"
- **THEN** a tela SHALL fechar (Navigator.pop) retornando para a `SplashScreen`

#### Scenario: Botão voltar fecha a tela
- **WHEN** o usuário toca no botão `←`
- **THEN** a tela SHALL fechar (Navigator.pop) retornando para a `SplashScreen`
