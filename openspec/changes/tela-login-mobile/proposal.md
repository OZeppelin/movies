## Why

O app de filmes não possui um fluxo de autenticação, impedindo que usuários acessem funcionalidades personalizadas como favoritos, histórico de compras e gerenciamento de ingressos. A tela de login e senha é a porta de entrada necessária para viabilizar essas experiências.

## What Changes

- Criação da tela de **Login** mobile com campos de e-mail e senha
- Criação do fluxo de **autenticação** com validação de campos e estados de loading/erro
- Adição de acesso a **"Esqueci minha senha"** (link de recuperação)
- Opção de **"Entrar com Google"** como autenticação alternativa (OAuth)
- Persistência de sessão após login bem-sucedido (token armazenado localmente)

## Capabilities

### New Capabilities

- `login-screen`: Tela mobile de login com e-mail, senha, validação de campos, estados de loading/erro, recuperação de senha e autenticação via Google

### Modified Capabilities

<!-- Nenhuma capability existente tem requisitos alterados por esta mudança -->

## Impact

- Novo ponto de entrada no fluxo de navegação do app — a tela de login antecede todas as telas autenticadas (Movie List, Movie Detail, Favoritos, Perfil)
- Dependência de um serviço de autenticação (ex: Firebase Auth ou API REST própria) para validação de credenciais e OAuth
- Armazenamento seguro de token de sessão no dispositivo (Keychain em iOS / Keystore em Android)
