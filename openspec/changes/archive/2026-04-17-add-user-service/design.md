## Context

O projeto usa MVVM com `provider`. A camada de serviços (`lib/services/`) segue o padrão do flutter-architecture skill: DataSources contêm apenas chamadas raw ao SDK, sem lógica de negócio. `UserService` é o DataSource para dados de usuário no Firebase Realtime Database.

`DatabaseFirebase.instance` já está disponível em `lib/core/`. O Firebase é inicializado em `main.dart` antes de `runApp`. O `device_info_plus` fornecerá o UDID do device para usar como chave primária do registro.

## Goals / Non-Goals

**Goals:**
- Criar `UserModel` imutável em `lib/models/` com campos essenciais (`id`, `name`, `email`, `numberPhone`, `password`, `createdAt`)
- Criar `UserService` em `lib/services/` com CRUD completo na referência `user/{udid}`
- Método `getDeviceId()` encapsula a lógica de obter o UDID por plataforma
- Serialização/deserialização de `UserModel` para `Map<String, dynamic>` (Firebase)

**Non-Goals:**
- Autenticação — responsabilidade do `LoginViewModel`/Firebase Auth
- Cache local — fora de escopo desta change
- Streams em tempo real (`onValue`) — pode ser adicionado futuramente; esta change foca em operações pontuais (`once`)

## Decisions

### `UserModel` com `fromMap` / `toMap`
Firebase Realtime Database retorna `Map<Object?, Object?>`. `UserModel.fromMap` converte para tipagem segura. `toMap` serializa para escrita. Não usa `dart_mappable` pois o projeto não tem a dependência instalada.

**Alternativa considerada:** `json_serializable` — rejeitada para manter o projeto sem geração de código neste momento.

### Chave primária = UDID do device via `device_info_plus`
- iOS: `IosDeviceInfo.identifierForVendor` — UUID estável por app/vendor
- Android: `AndroidDeviceInfo.id` — ID de build, estável por device
- Método `getDeviceId()` em `UserService` abstrai a diferença de plataforma

**Alternativa considerada:** `FirebaseAuth.currentUser!.uid` — rejeitada pois o usuário pode não estar autenticado no momento da criação.

### `UserService` com métodos `async` retornando `void` / `UserModel?`
- `createUser` e `updateUser`: `Future<void>` — escrita fire-and-forget com try/catch
- `getUser`: `Future<UserModel?>` — retorna `null` se não existir
- `deleteUser`: `Future<void>`

### Referência Firebase: `user/{id}`
O usuário especificou referência `user` (singular). Cada documento fica em `user/{udid}`.

## Risks / Trade-offs

- **[Risco] `identifierForVendor` pode ser `null` no iOS em casos edge** → Fallback: gerar UUID aleatório e persistir localmente com `shared_preferences` — fora do escopo desta change; documentar no código.
- **[Trade-off] Sem streams em tempo real** → Operações pontuais são suficientes para o MVP. `onValue` pode ser adicionado como extensão futura de `UserService`.
- **[Risco] `device_info_plus` requer permissões no Android** → `READ_PHONE_STATE` não é necessário para `AndroidDeviceInfo.id` no nível de API moderno.
