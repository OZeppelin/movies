## 1. Implementar PhoneMaskFormatter

- [x] 1.1 Criar classe `_PhoneMaskFormatter extends TextInputFormatter` em `criar_conta_step1_screen.dart`
- [x] 1.2 Implementar `formatEditUpdate`: extrair dígitos, limitar a 11, aplicar máscara progressiva `(XX) XXXXX-XXXX` / `(XX) XXXX-XXXX`
- [x] 1.3 Retornar `TextEditingValue` com cursor posicionado ao final do texto formatado

## 2. Atualizar campo de telefone

- [x] 2.1 Alterar `hintText` do campo telefone de `'+55 (11) 99999-0000'` para `'(11) 99999-0000'`
- [x] 2.2 Adicionar `inputFormatters: [_PhoneMaskFormatter()]` ao `CriarContaTextField` do telefone (ou ao `TextField` interno)

## 3. Strip de máscara no submit

- [x] 3.1 No handler do botão "Continuar", extrair dígitos: `final telefone = _telefoneController.text.replaceAll(RegExp(r'\D'), '')`
- [x] 3.2 Passar `telefone` (somente dígitos) para `viewModel.saveStep1(_nomeController.text, telefone)`
