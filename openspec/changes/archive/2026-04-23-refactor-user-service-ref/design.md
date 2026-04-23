## Context

`UserService` acessa o Realtime Database em `user/` em todos os métodos, mas repete o caminho como string em cada chamada. Um getter privado centraliza isso.

## Goals / Non-Goals

**Goals:**
- Getter `_ref` retorna `DatabaseFirebase.instance.ref('user')`
- Todos os métodos usam `ref('user')` em vez de `_ref.child(id)`

**Non-Goals:**
- Alterar assinaturas públicas ou comportamento dos métodos
- Alterar `getDeviceId`

## Decisions

**Getter privado `_ref`** em vez de constante de string
Retorna `DatabaseReference` diretamente, evitando reconstrução manual do caminho em cada método.

## Risks / Trade-offs

Nenhum — refatoração puramente interna, comportamento idêntico.
