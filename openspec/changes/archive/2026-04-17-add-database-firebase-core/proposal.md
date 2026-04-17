## Why

O projeto já possui o package `firebase_database` no `pubspec.yaml`, mas não há nenhuma classe que configure e exponha a instância do `FirebaseDatabase` com a `databaseURL` correta (`https://movieapp-6e5c1-default-rtdb.firebaseio.com/`). Qualquer feature que precisar acessar o Realtime Database teria que repetir essa configuração inline — centralizá-la em `lib/core/` evita duplicação e garante um único ponto de configuração.

## What Changes

- Criar `lib/core/database_firebase.dart` com a classe `DatabaseFirebase`
- A classe expõe `FirebaseDatabase.instanceFor(app: Firebase.app(), databaseURL: '...')` como instância singleton
- Seguir o padrão de core utilitários do projeto (similar a `AppColors`): classe com construtor privado e membros estáticos

## Capabilities

### New Capabilities
- `firebase-realtime-database-config`: Configuração centralizada do Firebase Realtime Database em `lib/core/`, expondo a instância do banco com a `databaseURL` correta.

### Modified Capabilities

## Impact

- Novo arquivo: `lib/core/database_firebase.dart`
- Sem breaking changes — nenhum código existente depende de configuração do Realtime Database
- Dependência já presente: `firebase_database: ^11.3.10`
- Firebase já inicializado em `main.dart` via `Firebase.initializeApp` — `DatabaseFirebase` pode ser usado logo após a inicialização
