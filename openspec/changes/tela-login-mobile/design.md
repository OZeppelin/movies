## Context

O app de filmes será construído em Flutter com suporte simultâneo a iOS e Android. A tela de login é a porta de entrada para usuários não autenticados e precisa integrar Firebase Authentication (e-mail/senha + OAuth Google) com a REST API do projeto, que utiliza o próprio token Firebase como Bearer JWT.

O design system já está definido no Figma (tema escuro, acento `#00E676`) e será traduzido para tokens Dart em `app/theme/tokens.dart`.

## Goals / Non-Goals

**Goals:**
- Definir a stack de autenticação em Flutter (Firebase Auth + Riverpod)
- Estabelecer o padrão de injeção do Bearer JWT nas requisições REST via interceptor Dio
- Definir armazenamento seguro do token de sessão no dispositivo
- Definir navegação pós-login com proteção de rotas

**Non-Goals:**
- Implementar tela de cadastro de novo usuário
- Implementar tela de recuperação de senha
- Definir autorização (permissões e roles) — apenas autenticação
- Sincronização de favoritos com servidor (Realm é source of truth local)

## Decisions

### 1. Gerenciamento de Estado: Riverpod 2.x com AsyncNotifier

Adotar `flutter_riverpod` com `AsyncNotifier` para o estado da tela de login e `StreamNotifier` para o estado de autenticação global.

**Estados do LoginNotifier:**
```
idle | loading | authenticated | error
```

**Alternativas consideradas:**
- **BLoC/Cubit**: robusto, mas verboso demais para uma tela com dois campos e um fluxo linear. Rejeitado pelo overhead de Events + States + Blocs.
- **Provider + ChangeNotifier**: cresce mal quando auth e outros domínios precisam se comunicar sem `BuildContext`. Rejeitado.
- **GetX**: mistura navegação + estado + DI num único pacote, dificultando testes isolados. Rejeitado.

---

### 2. Navegação: GoRouter com redirect guard

Adotar `go_router` para navegação declarativa com proteção de rotas baseada no estado do `authStateProvider`.

O guard fica em um único lugar no `router.dart`:

```dart
redirect: (context, state) {
  final isAuth = ref.read(authStateProvider).isAuthenticated;
  if (!isAuth && !state.uri.path.startsWith('/login')) return '/login';
  if (isAuth && state.uri.path == '/login') return '/movies';
  return null;
}
```

Após login bem-sucedido, navegar com `context.go('/movies')` — não `push` — para remover `/login` da stack e impedir retorno pelo botão voltar.

**Alternativas consideradas:**
- **Navigator 2.0 manual**: controle total, mas boilerplate alto e difícil de manter. Rejeitado.
- **auto_route**: geração de código, boa alternativa. Preterido pelo GoRouter ter suporte oficial Flutter team.

---

### 3. Autenticação: Firebase Auth (e-mail/senha + Google OAuth)

Firebase Authentication como provedor único de identidade. O token JWT gerado pelo Firebase é reutilizado como Bearer nas requisições à REST API — sem segundo sistema de auth.

**Configurações necessárias por plataforma:**
- Android: `google-services.json` em `android/app/`
- iOS: `GoogleService-Info.plist` em `ios/Runner/` + URL schemes no `Info.plist`
- SHA-1 do app registrado no Firebase Console para habilitar OAuth Google no Android

---

### 4. Injeção de Bearer JWT: AuthInterceptor no Dio

O token Firebase expira a cada hora. Um `Interceptor` no Dio renova e injeta o token automaticamente em toda requisição REST, sem que nenhum Notifier ou Widget precise gerenciar isso.

```dart
class AuthInterceptor extends Interceptor {
  final FirebaseAuth _auth;

  @override
  void onRequest(options, handler) async {
    final token = await _auth.currentUser?.getIdToken(true);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, handler) async {
    if (err.response?.statusCode == 401) {
      final token = await _auth.currentUser?.getIdToken(true);
      err.requestOptions.headers['Authorization'] = 'Bearer $token';
      final retry = await Dio().fetch(err.requestOptions);
      return handler.resolve(retry);
    }
    handler.next(err);
  }
}
```

`FirebaseAuth` e `Dio` ficam acoplados apenas no interceptor, isolados do restante da app.

---

### 5. Armazenamento Seguro: flutter_secure_storage

O token de sessão SHALL ser persistido via `flutter_secure_storage`, que usa Keychain no iOS e Keystore no Android. Nunca `SharedPreferences` (texto plano).

**Alternativas consideradas:**
- **SharedPreferences**: armazenamento em texto plano, vulnerável em dispositivos com root/jailbreak. Rejeitado por segurança.
- **Hive**: rápido para dados estruturados, mas sem criptografia nativa para tokens sensíveis. Rejeitado.

---

### 6. Validação de Formulário: inline manual (on blur + on submit)

A tela tem apenas dois campos. Não justifica adicionar `flutter_form_builder` ou similar.

Validação ocorre em dois momentos:
1. **On blur** (`onEditingComplete` / `FocusNode`): ao sair de cada campo
2. **On submit**: antes de disparar `signInWithEmail()`

---

### 7. Abstração do AuthService

Chamadas ao Firebase devem ser encapsuladas em um `AuthRepository`, nunca chamadas diretamente nos Notifiers. Isso permite trocar o provedor de autenticação sem tocar na camada de apresentação.

```
LoginNotifier
    └── AuthRepository (interface)
            └── FirebaseAuthSource (implementação)
```

## Risks / Trade-offs

- **Firebase lock-in** → Mitigação: `AuthRepository` como interface abstrai o provedor. Troca futura afeta apenas `FirebaseAuthSource`.
- **Token JWT expira em 1h** → Mitigado pelo `AuthInterceptor` com retry automático em 401.
- **OAuth Google em Android requer SHA-1** → Pode atrasar o setup inicial em máquinas novas. Documentar no README do projeto.
- **flutter_secure_storage em Android API < 23** → Requer `minSdkVersion 23` no `build.gradle`. Definir isso antes de configurar o projeto.
- **Sessão persistente** → Usuário permanece logado indefinidamente. Mitigação futura: timeout de sessão configurável.
