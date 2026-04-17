## 1. Adicionar dependência

- [x] 1.1 Adicionar `device_info_plus: ^10.1.2` ao `pubspec.yaml`
- [x] 1.2 Executar `flutter pub get`

## 2. Criar UserModel

- [x] 2.1 Criar `lib/models/user_model.dart` com campos `String id`, `String name`, `String numberPhone`, `String email`, `String password`, `String createdAt`
- [x] 2.2 Implementar construtor `const UserModel({required ...})`
- [x] 2.3 Implementar `factory UserModel.fromMap(Map<Object?, Object?> map)` com fallback para string vazia em campos ausentes
- [x] 2.4 Implementar `Map<String, dynamic> toMap()` retornando todos os campos

## 3. Criar UserService

- [x] 3.1 Criar `lib/services/user_service.dart` com classe `UserService`
- [x] 3.2 Implementar `Future<String> getDeviceId()` usando `device_info_plus` — `identifierForVendor` no iOS, `id` no Android
- [x] 3.3 Implementar `Future<void> createUser(UserModel user)` — `DatabaseFirebase.instance.ref('user/${user.id}').set(user.toMap())`
- [x] 3.4 Implementar `Future<UserModel?> getUser(String id)` — lê snapshot em `user/{id}`, retorna `null` se não existir
- [x] 3.5 Implementar `Future<void> updateUser(UserModel user)` — `DatabaseFirebase.instance.ref('user/${user.id}').update(user.toMap())`
- [x] 3.6 Implementar `Future<void> deleteUser(String id)` — `DatabaseFirebase.instance.ref('user/$id').remove()`

## 4. Verificação

- [x] 4.1 Executar `flutter analyze` e corrigir warnings
- [x] 4.2 Confirmar que `UserService` não contém lógica de negócio além de chamadas ao SDK
