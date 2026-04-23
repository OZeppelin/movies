## MODIFIED Requirements

### Requirement: UserService usa referência base centralizada para a tabela user
O sistema SHALL definir um getter privado `_ref` em `UserService` que retorna `DatabaseFirebase.instance.ref('user')`, e todos os métodos CRUD SHALL usar `_ref.child(id)` para construir referências filhas em vez de strings inline `'user/$id'`.

#### Scenario: createUser usa _ref
- **WHEN** `createUser` é chamado
- **THEN** o dado é gravado em `_ref.child(user.id)`, equivalente a `user/{id}`

#### Scenario: demais métodos usam _ref
- **WHEN** qualquer método CRUD acessa o banco
- **THEN** usa `_ref` como base, sem strings `'user/...'` inline
