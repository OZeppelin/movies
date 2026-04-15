# Spec: Firebase CLI Setup

## Purpose

Garantir que o ambiente de desenvolvimento tenha as ferramentas de linha de comando necessárias (Firebase CLI e FlutterFire CLI) instaladas e configuradas, e que o projeto Flutter esteja corretamente conectado a um projeto Firebase.

## Requirements

### Requirement: Firebase CLI instalada globalmente via npm
O ambiente de desenvolvimento SHALL ter a Firebase CLI instalada globalmente através do comando `npm install -g firebase-tools`, permitindo o uso do comando `firebase` no terminal.

#### Scenario: Firebase CLI disponível no terminal
- **WHEN** o comando `firebase --version` é executado no terminal
- **THEN** a versão instalada da Firebase CLI SHALL ser exibida sem erros

#### Scenario: Autenticação na Firebase CLI
- **WHEN** o comando `firebase login` é executado
- **THEN** o browser SHALL abrir a tela de autenticação do Google e, após login, a CLI SHALL confirmar autenticação com sucesso

### Requirement: FlutterFire CLI instalada via pub global
O ambiente de desenvolvimento SHALL ter o FlutterFire CLI instalado via `dart pub global activate flutterfire_cli`, permitindo o uso do comando `flutterfire` no terminal.

#### Scenario: FlutterFire CLI disponível no terminal
- **WHEN** o comando `flutterfire --version` é executado
- **THEN** a versão instalada SHALL ser exibida sem erros

### Requirement: Projeto Firebase configurado e conectado ao app Flutter
O projeto Flutter SHALL estar conectado a um projeto Firebase através do arquivo `lib/firebase_options.dart`, gerado automaticamente pelo FlutterFire CLI.

#### Scenario: Arquivo firebase_options.dart gerado
- **WHEN** o comando `flutterfire configure` é executado no diretório do projeto
- **THEN** o arquivo `lib/firebase_options.dart` SHALL ser criado com as configurações específicas para iOS e Android

#### Scenario: firebase_core inicializado no main.dart
- **WHEN** o aplicativo é iniciado
- **THEN** `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` SHALL ser chamado antes de `runApp()` em `lib/main.dart`

### Requirement: Dependência firebase_core no pubspec.yaml
O projeto Flutter SHALL declarar `firebase_core` como dependência no `pubspec.yaml` para habilitar a inicialização do Firebase no app.

#### Scenario: firebase_core presente no pubspec.yaml
- **WHEN** o `pubspec.yaml` é examinado
- **THEN** a dependência `firebase_core` SHALL estar listada em `dependencies` com uma versão compatível com o Flutter SDK em uso
