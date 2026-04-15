## 1. Pré-requisitos do Ambiente

- [x] 1.1 Verificar se Node.js (>= 18) está instalado: `node --version`
- [x] 1.2 Instalar Firebase CLI globalmente: `npm install -g firebase-tools`
- [x] 1.3 Verificar instalação da Firebase CLI: `firebase --version`
- [x] 1.4 Autenticar na Firebase CLI: `firebase login`
- [x] 1.5 Verificar se Flutter SDK está instalado e no PATH: `flutter --version`
- [x] 1.6 Instalar FlutterFire CLI: `dart pub global activate flutterfire_cli`
- [x] 1.7 Verificar instalação do FlutterFire CLI: `flutterfire --version`

## 2. Criação do Projeto Flutter

- [x] 2.1 Criar novo projeto Flutter: `flutter create movies --platforms ios,android`
- [x] 2.2 Remover o conteúdo padrão de `lib/main.dart` (manter apenas o esqueleto)
- [x] 2.3 Remover o arquivo `lib/counter.dart` ou equivalentes gerados automaticamente
- [x] 2.4 Remover o `test/widget_test.dart` padrão

## 3. Estrutura de Diretórios MVVM

- [x] 3.1 Criar diretório `lib/core/`
- [x] 3.2 Criar diretório `lib/models/`
- [x] 3.3 Criar diretório `lib/services/`
- [x] 3.4 Criar diretório `lib/viewmodels/`
- [x] 3.5 Criar diretório `lib/views/screens/`
- [x] 3.6 Criar diretório `lib/views/widgets/`
- [x] 3.7 Adicionar arquivo `.gitkeep` em cada diretório vazio para preservar a estrutura no git

## 4. Classe BaseViewModel

- [x] 4.1 Criar o arquivo `lib/viewmodels/base_view_model.dart`
- [x] 4.2 Implementar a classe `BaseViewModel extends ChangeNotifier` com estado básico de loading (`bool _isLoading`) e método `setLoading(bool value)`

## 5. Dependências no pubspec.yaml

- [x] 5.1 Adicionar `provider` em `dependencies` no `pubspec.yaml`
- [x] 5.2 Adicionar `firebase_core` em `dependencies` no `pubspec.yaml`
- [x] 5.3 Executar `flutter pub get` para instalar as dependências

## 6. Configuração do Firebase

- [x] 6.1 Criar um projeto no Firebase Console (ou usar projeto existente)
- [x] 6.2 Executar `flutterfire configure` no diretório raiz do projeto e selecionar o projeto Firebase
- [x] 6.3 Verificar que o arquivo `lib/firebase_options.dart` foi gerado corretamente
- [x] 6.4 Verificar que o arquivo `android/app/google-services.json` foi criado
- [x] 6.5 Verificar que o arquivo `ios/Runner/GoogleService-Info.plist` foi criado

## 7. Inicialização do Firebase no main.dart

- [x] 7.1 Adicionar `import 'package:firebase_core/firebase_core.dart'` no `lib/main.dart`
- [x] 7.2 Adicionar `import 'firebase_options.dart'` no `lib/main.dart`
- [x] 7.3 Tornar a função `main()` assíncrona (`async`)
- [x] 7.4 Adicionar `WidgetsFlutterBinding.ensureInitialized()` antes do `Firebase.initializeApp()`
- [x] 7.5 Adicionar `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` antes do `runApp()`

## 8. Verificação Final

- [x] 8.1 Executar `flutter analyze` e corrigir eventuais warnings ou erros
- [ ] 8.2 Executar o app em um emulador Android: `flutter run`
- [x] 8.3 Executar o app em um simulador iOS: `flutter run`
- [x] 8.4 Confirmar que o app inicializa sem erros de Firebase no console
