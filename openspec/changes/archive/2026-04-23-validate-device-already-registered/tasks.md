## 1. Validação em UserService

- [x] 1.1 Em `createUser`, consultar `_ref.child(user.id).get()` antes de gravar
- [x] 1.2 Se `snapshot.exists == true`, lançar `Exception('Device informado já foi cadastrado')`
- [x] 1.3 Se não existir, prosseguir com `_ref.child(user.id).set(user.toMap())`

## 2. Tratamento do erro na camada superior

- [x] 2.1 No ViewModel ou flow que chama `createUser`, capturar a `Exception` e exibir a mensagem ao usuário
