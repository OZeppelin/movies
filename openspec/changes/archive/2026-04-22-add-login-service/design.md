## Context

O projeto usa MVVM com `provider`. A autenticação existe via `LoginViewModel` (Firebase Auth), mas sem camada de serviço para persistência. O padrão estabelecido em `UserService` é: serviços fazem apenas chamadas SDK brutas, ViewModels contêm regras de negócio.

## Goals / Non-Goals

**Goals:**
- Criar `LoginService` para persistir log de acesso no Realtime Database após login
- Criar `LogUserModel` com `idUser` e `createdAt`
- Integrar `LoginViewModel` com `LoginService`
- Exibir `AlertDialog` em `login_screen.dart` após login bem-sucedido

**Non-Goals:**
- Autenticação por Google/Apple (já existe, não será alterada)
- Listagem ou consulta de logs
- Logout ou gerenciamento de sessão

## Decisions

**LogUserModel separado de UserModel**
`logUser` é um registro de acesso, não dados de perfil. Manter modelos separados preserva responsabilidade única.

**LoginService usa DatabaseFirebase.instance**
Consistente com `UserService`. Referência: `logUser/{uid}`.

**AlertDialog antes da navegação**
O dialog exibe email do usuário logado. Após fechar, navega via `Navigator.popUntil(isFirst)`.

**LoginViewModel injeta LoginService internamente**
Consistente com `UserViewModel` que instancia `UserService` diretamente (sem DI externa).

## Risks / Trade-offs

- `logUser` pode acumular entradas sem TTL → fora do escopo; aceito por ora
- Se `DatabaseFirebase` falhar ao gravar log, login ainda é considerado bem-sucedido → trade-off intencional (auth é crítica, log é secundário)
