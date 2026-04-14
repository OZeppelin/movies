## 1. Pré-requisitos do Ambiente

- [ ] 1.1 Verificar se Node.js (>= 18) está instalado: `node --version`
- [ ] 1.2 Instalar Firebase CLI globalmente: `npm install -g firebase-tools`
- [ ] 1.3 Verificar instalação da Firebase CLI: `firebase --version`
- [ ] 1.4 Autenticar na Firebase CLI: `firebase login`
- [ ] 1.5 Verificar se Flutter SDK está instalado e no PATH: `flutter --version`
- [ ] 1.6 Instalar FlutterFire CLI: `dart pub global activate flutterfire_cli`
- [ ] 1.7 Verificar instalação do FlutterFire CLI: `flutterfire --version`

## 2. Criação do Projeto Flutter

- [ ] 2.1 Criar novo projeto Flutter: `flutter create movies --platforms ios,android`
- [ ] 2.2 Remover o conteúdo padrão de `lib/main.dart` (manter apenas o esqueleto)
- [ ] 2.3 Remover o arquivo `lib/counter.dart` ou equivalentes gerados automaticamente
- [ ] 2.4 Remover o `test/widget_test.dart` padrão

## 3. Estrutura de Diretórios MVVM

- [ ] 3.1 Criar diretório `lib/core/`
- [ ] 3.2 Criar diretório `lib/models/`
- [ ] 3.3 Criar diretório `lib/services/`
- [ ] 3.4 Criar diretório `lib/viewmodels/`
- [ ] 3.5 Criar diretório `lib/views/screens/`
- [ ] 3.6 Criar diretório `lib/views/widgets/`
- [ ] 3.7 Adicionar arquivo `.gitkeep` em cada diretório vazio para preservar a estrutura no git

## 4. Classe BaseViewModel

- [ ] 4.1 Criar o arquivo `lib/viewmodels/base_view_model.dart`
- [ ] 4.2 Implementar a classe `BaseViewModel extends ChangeNotifier` com estado básico de loading (`bool _isLoading`) e método `setLoading(bool value)`

## 5. Dependências no pubspec.yaml

- [ ] 5.1 Adicionar `provider` em `dependencies` no `pubspec.yaml`
- [ ] 5.2 Adicionar `firebase_core` em `dependencies` no `pubspec.yaml`
- [ ] 5.3 Executar `flutter pub get` para instalar as dependências

## 6. Configuração do Firebase

- [ ] 6.1 Criar um projeto no Firebase Console (ou usar projeto existente)
- [ ] 6.2 Executar `flutterfire configure` no diretório raiz do projeto e selecionar o projeto Firebase
- [ ] 6.3 Verificar que o arquivo `lib/firebase_options.dart` foi gerado corretamente
- [ ] 6.4 Verificar que o arquivo `android/app/google-services.json` foi criado
- [ ] 6.5 Verificar que o arquivo `ios/Runner/GoogleService-Info.plist` foi criado

## 7. Inicialização do Firebase no main.dart

- [ ] 7.1 Adicionar `import 'package:firebase_core/firebase_core.dart'` no `lib/main.dart`
- [ ] 7.2 Adicionar `import 'firebase_options.dart'` no `lib/main.dart`
- [ ] 7.3 Tornar a função `main()` assíncrona (`async`)
- [ ] 7.4 Adicionar `WidgetsFlutterBinding.ensureInitialized()` antes do `Firebase.initializeApp()`
- [ ] 7.5 Adicionar `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` antes do `runApp()`

## 8. Verificação Final

- [ ] 8.1 Executar `flutter analyze` e corrigir eventuais warnings ou erros
- [ ] 8.2 Executar o app em um emulador Android: `flutter run`
- [ ] 8.3 Executar o app em um simulador iOS: `flutter run`
- [ ] 8.4 Confirmar que o app inicializa sem erros de Firebase no console
