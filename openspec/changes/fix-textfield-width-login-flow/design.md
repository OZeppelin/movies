## Context

No arquivo `movieApp DS — Login Flow` (`lT8Jhe8Q1HzH7yWgjFCUBh`), os campos de input foram criados com largura menor que a disponível. Os botões de CTA já usam `W - 48 = 327px` (padding lateral de 24px de cada lado), mas os campos ficaram com largura reduzida (~200px) por não terem sido explicitamente dimensionados ao mesmo padrão.

A tela tem `W = 375px`. O padrão de espaçamento do design system usa `spacing/lg = 16px` por lado, totalizando `375 - 48 = 327px` de largura útil — igual aos botões.

## Goals / Non-Goals

**Goals:**
- Padronizar todos os frames de Input para `327px` de largura em todas as telas do Login Flow
- Manter o `x = 24` (alinhamento esquerdo com padding de 24px)
- Manter altura, estilo visual e conteúdo dos campos inalterados

**Non-Goals:**
- Alterar o componente Input na Library
- Alterar qualquer outro elemento das telas (botões, textos, ícones)
- Modificar o arquivo Library

## Decisions

### D1 — Largura alvo: 327px (`W - 48`)

Os campos passam de largura variável/reduzida para `327px` fixo, alinhado ao mesmo grid dos botões CTAs. Alternativa de `W - 32 = 343px` foi descartada por quebrar a consistência com os botões existentes.

### D2 — Operação via MCP Figma `use_figma`

O ajuste será feito via Plugin API do Figma com `node.resize(327, node.height)` em cada frame de Input identificado pelo seu ID. A operação é não-destrutiva — apenas redimensiona, sem alterar fills, strokes ou conteúdo.

### D3 — Telas afetadas e IDs dos campos

| Tela | Frame de Input | IDs |
|---|---|---|
| 05-Cadastro-Step1 | Nome, Telefone | 5:10, 5:13 |
| 06-Cadastro-Step2 | Email, Senha, Confirmar senha | 5:25, 5:28, 5:31 |
| 07-Cadastro-Step3 | (sem input de texto) | — |
| 09-Login | Email, Senha | 5:74, 5:77 |
| 11-Esqueci-Senha | Email | 5:109 |

Os boxes individuais do OTP (08) têm comportamento diferente (6 caixas fixas) e **não são afetados** por este ajuste.

## Risks / Trade-offs

- **[Risco] IDs podem ter mudado** se o arquivo foi editado manualmente no Figma → Mitigação: inspecionar IDs antes de aplicar resize
- **[Trade-off] Campos do OTP não ajustados** → Aceitável: OTP usa layout de 6 dígitos fixos, não é um TextField convencional
