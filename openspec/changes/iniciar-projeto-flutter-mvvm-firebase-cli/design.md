## Context

O projeto ainda não possui uma base Flutter estabelecida. A decisão de adotar MVVM garante separação clara entre lógica de negócio e UI, facilitando testes unitários e manutenção. O Firebase é a plataforma de backend escolhida para prover autenticação, banco de dados em tempo real e outros serviços gerenciados.

A Firebase CLI é uma ferramenta de linha de comando que roda sobre Node.js e é necessária para inicializar e gerenciar projetos Firebase. O FlutterFire CLI é um pacote Dart que automatiza a geração do arquivo `firebase_options.dart`, eliminando configuração manual por plataforma.

Não há código Flutter legado — este é o ponto de partida do projeto.

## Goals / Non-Goals

**Goals:**
- Definir a estrutura de diretórios MVVM para o projeto Flutter
- Estabelecer convenções de nomenclatura e organização de arquivos
- Documentar o processo de instalação da Firebase CLI e FlutterFire CLI
- Configurar o projeto para funcionar em iOS e Android

**Non-Goals:**
- Implementar funcionalidades de negócio (login, catálogo de filmes, etc.)
- Configurar CI/CD ou ambientes de staging/produção
- Definir design system ou temas visuais
- Integrar plugins Firebase além do `firebase_core` (ex: Firestore, Auth — serão adicionados em mudanças futuras)

## Decisions

### 1. Arquitetura MVVM com ChangeNotifier (sem pacote de state management externo na base)

**Decisão**: Usar `ChangeNotifier` + `Provider` como camada de state management para os ViewModels.

**Rationale**: Provider é a solução oficial recomendada pela equipe Flutter para projetos de pequeno a médio porte. Evita dependência de pacotes com curva de aprendizado elevada (Bloc, Riverpod) no bootstrapping. Pode ser substituído depois sem reescrever a arquitetura.

**Alternativas consideradas**:
- `Riverpod`: mais robusto, mas adiciona complexidade desnecessária no início
- `GetX`: abordagem opinionada que mistura responsabilidades; dificulta testes
- `Bloc`: verboso para o estágio atual do projeto

### 2. Estrutura de diretórios por camada (não por feature)

**Decisão**: Organizar `lib/` por camada arquitetural primeiro.

```
lib/
  core/           # utilitários, constantes, extensões, temas
  models/         # entidades e modelos de dados
  services/       # serviços externos (Firebase, HTTP, etc.)
  viewmodels/     # lógica de negócio e estado
  views/
    screens/      # telas completas
    widgets/      # componentes reutilizáveis
  main.dart
```

**Rationale**: Para projetos no início do ciclo de vida, organização por camada é mais simples de navegar e manter. Migração para organização por feature pode ser feita progressivamente quando o número de telas crescer.

**Alternativas consideradas**:
- Organização por feature desde o início: prematura para o volume atual de código

### 3. Firebase CLI via npm (não via binário standalone)

**Decisão**: Instalar Firebase CLI com `npm install -g firebase-tools`.

**Rationale**: Método oficial e mais atualizado. Requer Node.js, mas este já é pré-requisito de desenvolvimento comum. O binário standalone está em preview e tem menos suporte.

### 4. FlutterFire CLI para geração do `firebase_options.dart`

**Decisão**: Usar `flutterfire configure` para gerar as configurações por plataforma automaticamente.

**Rationale**: Elimina a necessidade de baixar e posicionar manualmente arquivos `google-services.json` (Android) e `GoogleService-Info.plist` (iOS). Reduz erros de configuração.

## Risks / Trade-offs

- **Node.js como pré-requisito** → O desenvolvedor precisa ter Node.js instalado antes de configurar Firebase CLI. Mitigação: documentar claramente no README o passo de instalação do Node.js e versão mínima requerida (≥ 18).

- **Provider pode precisar ser substituído** → Se o projeto crescer em complexidade, a migração para Riverpod ou Bloc exigirá refatoração dos ViewModels. Mitigação: manter ViewModels desacoplados do Provider (sem referências diretas nos construtores), facilitando a troca.

- **`firebase_options.dart` contém chaves de API** → O arquivo gerado pelo FlutterFire CLI inclui chaves públicas do Firebase que, por convenção, são commitadas no repositório (são protegidas pelas regras de segurança do Firebase, não por sigilo). Mitigação: documentar que as chaves são públicas por design, mas que as regras de segurança do Firebase devem ser configuradas corretamente.
