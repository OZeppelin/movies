## Why

O projeto precisa de uma base sólida em Flutter com arquitetura MVVM para suportar desenvolvimento multiplataforma (iOS e Android) de forma escalável e testável. A instalação da CLI do Firebase é necessária para habilitar serviços como autenticação, banco de dados e analytics desde o início do projeto.

## What Changes

- Criação da estrutura base do projeto Flutter com arquitetura MVVM
- Organização de diretórios seguindo separação de responsabilidades (model, view, viewmodel)
- Configuração inicial para suporte a iOS e Android
- Instalação e configuração da Firebase CLI no ambiente de desenvolvimento
- Integração do FlutterFire CLI para conectar o app Flutter ao projeto Firebase

## Capabilities

### New Capabilities

- `flutter-project-setup`: Estrutura base do projeto Flutter com arquitetura MVVM, incluindo organização de diretórios, dependências iniciais e configuração para iOS e Android
- `firebase-cli-setup`: Instalação da Firebase CLI e FlutterFire CLI, configuração do projeto Firebase e geração do arquivo `firebase_options.dart`

### Modified Capabilities

<!-- Nenhuma capability existente está sendo modificada nesta mudança -->

## Impact

- **Plataformas**: iOS e Android
- **Dependências**: Flutter SDK, Firebase CLI (Node.js), FlutterFire CLI, pacotes `firebase_core`, `firebase_auth` (conforme necessidade)
- **Estrutura de diretórios**: criação de `lib/models/`, `lib/views/`, `lib/viewmodels/`, `lib/services/`, `lib/core/`
- **Ferramentas externas**: requer Node.js instalado para a Firebase CLI
