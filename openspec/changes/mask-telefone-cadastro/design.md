## Context

O campo `_telefoneController` em `criar_conta_step1_screen.dart` aceita qualquer texto sem formatação. O `UserViewModel.saveStep1` armazena o valor bruto em `_numberPhone`, e `validateStep1` já strip dígitos para validação. O banco de dados espera somente dígitos, mas nenhuma camada garante isso na escrita.

## Goals / Non-Goals

**Goals:**
- Aplicar máscara `(XX) XXXXX-XXXX` (10–11 dígitos) enquanto o usuário digita
- Garantir que somente dígitos chegam ao ViewModel e ao banco de dados
- Alterar hintText para `'(11) 99999-0000'`

**Non-Goals:**
- Validar o formato do número além do que já existe em `validateStep1`
- Suporte a números internacionais
- Adicionar package externo

## Decisions

### 1. Custom `TextInputFormatter` em Dart puro

Implementar `_PhoneMaskFormatter extends TextInputFormatter` diretamente em `criar_conta_step1_screen.dart`.

**Lógica:**
1. Extrair somente dígitos do novo valor
2. Limitar a 11 dígitos
3. Aplicar máscara progressiva:
   - 0–2 dígitos: `XX`
   - 2–6: `(XX) XXXX`
   - 6–10: `(XX) XXXX-XXXX` (fixo)
   - 10–11: `(XX) XXXXX-XXXX` (celular, substitui formato fixo)
4. Reposicionar cursor ao final

**Alternativa descartada:** `mask_text_input_formatter` package — adiciona dependência desnecessária para uma máscara simples.

### 2. Strip de máscara no submit

No handler do botão "Próximo", extrair dígitos antes de chamar `saveStep1`:

```dart
final telefone = _telefoneController.text.replaceAll(RegExp(r'\D'), '');
viewModel.saveStep1(_nomeController.text, telefone);
```

`UserViewModel.saveStep1` não precisa de alteração.

## Risks / Trade-offs

- [Cursor jump] Ao deletar caracteres no meio do campo, o cursor pode pular para o final → Mitigação: aceitar comportamento (cursor ao final é padrão para masks); usuário raramente edita no meio de um telefone
- [11 dígitos] Máscara fixa pode não cobrir todos os formatos regionais → Mitigação: dentro do escopo brasileiro standard; `validateStep1` já valida mínimo 10 dígitos

## Migration Plan

Mudança localizada em uma única tela. Não há migração de dados — os números já gravados no banco permanecem inalterados. Novo fluxo de cadastro sempre enviará dígitos puros, sem impacto retroativo.
