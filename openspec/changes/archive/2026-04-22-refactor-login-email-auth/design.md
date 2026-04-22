## Context

`UserService.getUserByEmail` já existe e retorna `UserModel?`. `UserModel` contém o campo `password`. `LoginService.saveLog` já salva em `logUser/{idUser}`. A refatoração é cirúrgica: apenas o corpo de `entrarComEmail` muda.

## Goals / Non-Goals

**Goals:**
- Substituir `FirebaseAuth.signInWithEmailAndPassword` por lookup + comparação de senha no Realtime Database
- Manter salvamento do log via `LoginService.saveLog` após autenticação bem-sucedida
- Expor `loggedUser` com o `UserModel` autenticado

**Non-Goals:**
- Alterar `entrarComGoogle` ou `entrarComApple`
- Hash ou criptografia de senha (fora do escopo)
- Migração de usuários existentes no Firebase Auth

## Decisions

**Usar `user.id` como `idUser` no log**
O `UserModel.id` é o UDID do device, consistente com como o usuário foi cadastrado. É o identificador mais estável para o log.

**Comparação de senha case-sensitive**
Senhas são case-sensitive por convenção. Comparação direta com `==`.

**Erro unificado para "não encontrado" e "senha errada"**
Não revelar qual dado está incorreto (segurança básica): mensagem única `'Email ou senha inválidos'`.

## Risks / Trade-offs

- Senha em texto plano no Realtime Database → risco real, mas é o modelo atual; fora do escopo desta refatoração
- `getUserByEmail` faz full-scan da tabela `user/` → aceitável para o volume atual
