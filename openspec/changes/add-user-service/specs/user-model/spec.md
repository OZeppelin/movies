## ADDED Requirements

### Requirement: UserModel representa os dados de um usuário
`UserModel` em `lib/models/user_model.dart` SHALL ser uma classe imutável com campos `String id`, `String name`, `String numberPhone`, `String email`, `String password`, `String createdAt`. SHALL expor `UserModel.fromMap(Map<Object?, Object?> map)` e `Map<String, dynamic> toMap()` para serialização com o Firebase Realtime Database.


#### Scenario: Desserialização a partir do Firebase
- **WHEN** `UserModel.fromMap` recebe um `Map<Object?, Object?>` do Firebase
- **THEN** SHALL retornar uma instância de `UserModel` com os campos corretamente tipados como `String`
- **THEN** campos ausentes no mapa SHALL resultar em string vazia como fallback

#### Scenario: Serialização para o Firebase
- **WHEN** `toMap()` é chamado em uma instância de `UserModel`
- **THEN** SHALL retornar `Map<String, dynamic>` com as chaves `id`, `name`, `email`, `numberPhone`,`password`, `createdAt`
- **THEN** todos os valores SHALL ser do tipo `String`
