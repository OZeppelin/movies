## Context

O app de filmes possui fluxo de navegação entre Movie List e Movie Detail, mas não conta com camada de autenticação. A tela de login será a porta de entrada para todos os usuários não autenticados, integrando-se ao design system existente (tema escuro, acento verde neon `#00E676`) e ao fluxo de navegação já estabelecido.

O projeto ainda não possui um serviço de autenticação definido. Esta decisão de design aborda a escolha da estratégia de autenticação e os padrões de implementação para mobile.

## Goals / Non-Goals

**Goals:**
- Definir a arquitetura de autenticação (provedor, armazenamento de token, fluxo OAuth)
- Estabelecer o padrão de validação de formulários para a tela de login
- Definir a estratégia de gerenciamento de estado durante o fluxo de autenticação
- Garantir armazenamento seguro de credenciais/tokens no dispositivo

**Non-Goals:**
- Implementar tela de cadastro de novo usuário (escopo futuro)
- Implementar tela de recuperação de senha (referenciada na spec, mas fora deste escopo)
- Definir autorização (permissões e roles) — apenas autenticação

## Decisions

### 1. Provedor de Autenticação: Firebase Authentication

Adotar o Firebase Authentication como backend de autenticação, suportando e-mail/senha e OAuth com Google.

**Alternativas consideradas:**
- **API REST própria**: Requer implementação do servidor de auth do zero, aumenta tempo e risco de segurança. Rejeitado pelo custo de desenvolvimento.
- **Supabase Auth**: Boa alternativa, mas o ecossistema Firebase já é familiar e tem SDK mobile maduro.
- **Auth0**: Mais robusto para enterprise, mas overkill para o estágio atual do projeto.

---

### 2. Armazenamento de Token: Keychain (iOS) / Keystore (Android)

O token de sessão retornado pelo Firebase SHALL ser armazenado no cofre seguro do sistema operacional, nunca em AsyncStorage ou SharedPreferences.

**Alternativas consideradas:**
- **AsyncStorage**: Armazenamento em texto plano, vulnerável a leitura por outros apps em dispositivos com root/jailbreak. Rejeitado por razões de segurança.
- **SecureStore (Expo)**: Abstração do Keychain/Keystore — adotar se o projeto usar Expo; caso contrário, usar `react-native-keychain` diretamente.

---

### 3. Gerenciamento de Estado: Context API + useReducer

O estado de autenticação (usuário autenticado, token, loading, erro) será gerenciado via React Context + `useReducer`, exposto através de um `AuthContext` global.

**Estados do reducer:**
```
idle | loading | authenticated | error
```

**Alternativas consideradas:**
- **Redux Toolkit**: Adequado para projetos maiores. Rejeitado por overhead desnecessário para um contexto de auth simples.
- **Zustand**: Boa alternativa leve. Pode ser adotado no futuro se o estado global crescer além do auth.

---

### 4. Validação de Formulário: Validação inline (on blur + on submit)

A validação SHALL ocorrer em dois momentos:
1. **On blur**: Ao sair de cada campo individualmente
2. **On submit**: Antes de disparar a requisição de autenticação

Não utilizar bibliotecas como Formik ou React Hook Form neste momento — a tela tem apenas 2 campos e a complexidade não justifica a dependência.

---

### 5. Fluxo de Navegação Pós-Login

Após autenticação bem-sucedida, o usuário é navegado para `MovieListScreen` usando `navigation.replace()` (não `navigate()`), removendo a tela de login da stack de navegação e impedindo que o botão "voltar" retorne ao login.

## Risks / Trade-offs

- **Firebase lock-in**: Adotar Firebase como provedor cria dependência do serviço. Mitigação: abstrair chamadas de auth em um serviço (`AuthService`) para facilitar troca futura de provedor.
- **OAuth Google em ambiente de desenvolvimento**: Requer configuração de SHA-1 no Firebase Console e arquivo `google-services.json` (Android) / `GoogleService-Info.plist` (iOS). Pode atrasar o primeiro setup.
- **Sessão persistente vs. segurança**: Manter o usuário logado melhora UX mas aumenta o risco em dispositivos compartilhados. Mitigação: implementar timeout de sessão configurável (ex: 30 dias) em versão futura.
- **Validação apenas no cliente**: A validação de formato de e-mail no front-end não substitui validação no servidor. O Firebase já rejeita e-mails malformados na API, mas erros devem ser tratados na camada de serviço.
