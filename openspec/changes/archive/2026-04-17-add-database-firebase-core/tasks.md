## 1. Criar DatabaseFirebase

- [x] 1.1 Criar `lib/core/database_firebase.dart` com classe `final DatabaseFirebase` e construtor privado `DatabaseFirebase._();`
- [x] 1.2 Adicionar getter estático `instance` retornando `FirebaseDatabase.instanceFor(app: Firebase.app(), databaseURL: 'https://movieapp-6e5c1-default-rtdb.firebaseio.com/')`
- [x] 1.3 Adicionar imports de `firebase_core` e `firebase_database`

## 2. Verificação

- [x] 2.1 Executar `flutter analyze` em `lib/core/database_firebase.dart` e corrigir warnings
- [x] 2.2 Confirmar que a classe não contém métodos de leitura/escrita de dados
