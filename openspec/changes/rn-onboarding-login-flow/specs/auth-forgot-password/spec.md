## ADDED Requirements

### Requirement: Tela de recuperação de senha via email
O sistema SHALL exibir a tela "Recuperar senha" (11-Esqueci-Senha do Figma) com:
- Botão voltar `←`
- Título "Recuperar senha" (`titleMedium`)
- Subtítulo "Informe seu email e enviaremos um link de redefinição." (`bodySmall`, `placeholder`)
- Ícone de envelope centralizado (dentro de círculo)
- Campo `AppInput` para Email
- Botão primário "Enviar link de recuperação"
- Link "Lembrei minha senha — Entrar" no rodapé que navega para Login

#### Scenario: Email vazio bloqueia envio
- **WHEN** usuário toca "Enviar link de recuperação" com campo email vazio
- **THEN** mensagem "Informe seu email" é exibida e requisição não é feita

#### Scenario: Email inválido exibe erro de formato
- **WHEN** usuário insere texto sem formato de email e toca enviar
- **THEN** mensagem "Email inválido" é exibida no campo

#### Scenario: Email válido exibe feedback de sucesso
- **WHEN** usuário insere email válido e toca "Enviar link de recuperação"
- **THEN** mensagem de confirmação "Link enviado para o seu email" é exibida e botão fica desabilitado por 60 segundos para evitar spam

#### Scenario: Email não cadastrado não revela existência
- **WHEN** API retorna erro 404 (email não encontrado)
- **THEN** a mesma mensagem de sucesso é exibida (sem revelar se o email está ou não cadastrado, por segurança)

---

### Requirement: Retorno ao Login a partir da recuperação de senha
O sistema SHALL permitir navegar de volta ao Login a partir da tela de recuperação de senha.

#### Scenario: Botão voltar retorna ao Login
- **WHEN** usuário toca `←` na tela de recuperação de senha
- **THEN** app navega para a tela de Login

#### Scenario: Link "Lembrei minha senha" retorna ao Login
- **WHEN** usuário toca "Lembrei minha senha — Entrar"
- **THEN** app navega para a tela de Login
