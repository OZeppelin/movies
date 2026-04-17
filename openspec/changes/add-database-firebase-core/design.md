## Context

O projeto usa MVVM com `provider` + `ChangeNotifier`. Componentes cross-feature residem em `lib/core/` (atualmente só `AppColors`). O Firebase já é inicializado em `main.dart` antes de `runApp`, então qualquer acesso ao `FirebaseDatabase` após esse ponto é seguro.

O flutter-architecture skill define que DataSources devem conter apenas chamadas raw ao SDK, sem lógica de negócio. `DatabaseFirebase` é o equivalente core dessa responsabilidade: configura e expõe a instância do banco para que DataSources de features possam consumi-la.

## Goals / Non-Goals

**Goals:**
- Centralizar a configuração do `FirebaseDatabase` com a `databaseURL` correta em um único lugar em `lib/core/`
- Expor a instância via getter estático para uso por qualquer feature do projeto
- Seguir o padrão de `AppColors`: classe `final` com construtor privado, membro estático

**Non-Goals:**
- Métodos de leitura/escrita de dados — responsabilidade dos DataSources de cada feature
- Injeção de dependência ou `injectable` — o projeto usa instâncias diretas
- Tratamento de erros de conexão — responsabilidade de quem consome a instância

## Decisions

### Classe `final` com construtor privado e getter estático
Consistente com `AppColors` no mesmo `lib/core/`. Não há necessidade de instanciação — o `FirebaseDatabase` já é um singleton gerenciado pelo SDK.

**Alternativa considerada:** Registrar via `injectable` como `@singleton` — rejeitada porque o projeto não usa `injectable`.

### `FirebaseDatabase.instanceFor` com `databaseURL` explícito
O `firebase_database` pode inferir a URL do `google-services.json`/`GoogleService-Info.plist`, mas especificá-la explicitamente em código garante que a URL correta (`https://movieapp-6e5c1-default-rtdb.firebaseio.com/`) seja sempre usada, independentemente de variações na configuração de ambiente.

**Alternativa considerada:** `FirebaseDatabase.instance` (sem URL explícita) — rejeitada por ser implícita e propensa a erros silenciosos em configurações multi-ambiente.

### Localização: `lib/core/database_firebase.dart`
Segue a convenção do projeto: utilitários e configurações globais ficam em `lib/core/`. Nome do arquivo em `snake_case` consistente com o restante da base.

## Risks / Trade-offs

- **[Risco] Firebase não inicializado antes do acesso** → Mitigado: `main.dart` já chama `Firebase.initializeApp` antes de `runApp`. `DatabaseFirebase.instance` só deve ser acessado após isso.
- **[Trade-off] URL hardcoded** → Tradeoff intencional de simplicidade: o projeto tem um único ambiente de banco de dados. Se múltiplos ambientes forem necessários no futuro, a classe pode ser expandida para receber a URL via variável de ambiente.
