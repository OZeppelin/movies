# firebase-realtime-database-config

## Purpose

Centraliza a configuração da instância do Firebase Realtime Database, expondo um ponto de acesso único e imutável para uso pelos DataSources das features.

---

## Requirements

### Requirement: DatabaseFirebase centraliza configuração do Realtime Database
A classe `DatabaseFirebase` em `lib/core/database_firebase.dart` SHALL ser `final` com construtor privado e SHALL expor um getter estático `instance` que retorna `FirebaseDatabase.instanceFor(app: Firebase.app(), databaseURL: 'https://movieapp-6e5c1-default-rtdb.firebaseio.com/')`.

#### Scenario: Acesso à instância configurada
- **WHEN** qualquer parte do código chamar `DatabaseFirebase.instance`
- **THEN** SHALL retornar uma instância de `FirebaseDatabase` configurada com `databaseURL: 'https://movieapp-6e5c1-default-rtdb.firebaseio.com/'`
- **THEN** NÃO SHALL ser possível instanciar `DatabaseFirebase` diretamente (construtor privado)

#### Scenario: Compatibilidade com inicialização Firebase existente
- **WHEN** `DatabaseFirebase.instance` é acessado após `Firebase.initializeApp` em `main.dart`
- **THEN** SHALL retornar sem lançar exceções
- **THEN** SHALL referenciar o app Firebase padrão já inicializado

---

### Requirement: DatabaseFirebase não contém lógica de negócio
A classe `DatabaseFirebase` SHALL conter apenas a configuração da instância do banco. Operações de leitura, escrita e query SHALL ser responsabilidade dos DataSources de cada feature.

#### Scenario: Responsabilidade única
- **WHEN** `DatabaseFirebase` é inspecionada
- **THEN** NÃO SHALL conter métodos de leitura ou escrita de dados
- **THEN** NÃO SHALL conter mapeamento de modelos ou lógica de negócio
- **THEN** SHALL expor apenas a instância configurada de `FirebaseDatabase`
