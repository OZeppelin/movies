## 1. Refatoração

- [x] 1.1 Adicionar getter privado `DatabaseReference get _ref => DatabaseFirebase.instance.ref('user')` em `UserService`
- [x] 1.2 Refatorar `createUser`, `getUser`, `updateUser`, `deleteUser` e `getUserByEmail` para usar `_ref('user')` em vez de `DatabaseFirebase.instance.ref('user').child(id)`



