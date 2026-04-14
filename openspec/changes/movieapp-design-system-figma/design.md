## Context

O movieApp é um aplicativo mobile de filmes sendo construído em Flutter. Não existe design system documentado ainda. A referência visual é o app Taxio (amarelo #F5C142 + dark #1A1A2E), adaptada para o domínio de filmes.

A exportação para Figma será feita via MCP (`use_figma`, `generate_figma_design`, `create_design_system_rules`). O Figma receberá dois arquivos distintos seguindo a arquitetura padrão de design systems profissionais: Library (tokens + componentes) e Flows (telas).

Os tokens de design devem ter naming compatível com o `ThemeData` do Flutter para facilitar a implementação futura sem necessidade de mapeamento adicional.

## Goals / Non-Goals

**Goals:**
- Definir e exportar foundations como Figma Variables com naming Flutter-compatible
- Criar biblioteca de componentes com variants e estados no Figma
- Produzir fluxo de login completo (11 telas) como protótipo navegável no Figma
- Garantir que componentes das telas consumam os tokens da Library (sem hardcode)

**Non-Goals:**
- Implementação Flutter dos componentes (fase posterior)
- Design de telas além do fluxo de autenticação
- Suporte a dark mode (segunda fase)
- Animações e micro-interações (segunda fase)

## Decisions

### D1 — Dois arquivos Figma separados (Library + Flows)

**Decisão:** Criar `movieApp DS — Library` e `movieApp DS — Login Flow` como arquivos independentes.

**Rationale:** Segue o padrão industry-standard (ex: Material Design, Atlassian). A Library pode ser publicada e consumida por múltiplos flows futuros sem acoplamento. Alternativa (arquivo único) foi descartada por dificultar escalabilidade.

---

### D2 — Naming de tokens seguindo Flutter ThemeData

**Decisão:** Tokens nomeados com os caminhos do Flutter:

```
colorScheme/primary         → #F5C142
colorScheme/onPrimary       → #1A1A2E
colorScheme/surface         → #FAFAFA
colorScheme/onSurface       → #1A1A2E
colorScheme/error           → #E53E3E
textTheme/titleLarge        → Bold, 28px, #1A1A2E
textTheme/titleMedium       → SemiBold, 22px, #1A1A2E
textTheme/bodyMedium        → Regular, 16px, #1A1A2E
textTheme/bodySmall         → Regular, 14px, #6B6B6B
textTheme/labelSmall        → Medium, 12px, #6B6B6B
```

**Rationale:** Elimina trabalho de mapeamento na implementação Flutter. O dev consulta o Figma e usa o token diretamente no código.

---

### D3 — Paleta baseada no Taxio, adaptada para filmes

**Decisão:** Manter amarelo #F5C142 como `colorScheme.primary` e dark #1A1A2E como superfície e texto.

**Rationale:** Amarelo âmbar sobre dark tem referências fortes no domínio de filmes (IMDb #F5C518). A combinação evoca cinema sem precisar de redesign completo da identidade.

---

### D4 — Componentes com Auto Layout e variants nomeadas

**Decisão:** Todos os componentes usam Figma Auto Layout. Variants seguem nomenclatura `Type / State / Size`.

**Rationale:** Auto Layout garante responsividade. Naming padronizado facilita handoff para o Flutter dev.

---

### D5 — Fluxo de login com 11 telas em ordem de navegação

**Decisão:** Telas conectadas via protótipo no arquivo Login Flow:

```
1.  Splash
2.  Onboarding 1/3
3.  Onboarding 2/3
4.  Onboarding 3/3
5.  Cadastro Step 1 (Nome + Telefone)
6.  Cadastro Step 2 (Email + Senha)
7.  Cadastro Step 3 (Confirmação)
8.  OTP / Verificação
9.  Login
10. Biometria (Touch ID / Face ID)
11. Esqueci minha senha
```

## Risks / Trade-offs

- **[Risco] MCP Figma pode não suportar Figma Variables programaticamente** → Mitigação: criar tokens como Figma Styles como fallback, migrar para Variables manualmente se necessário.
- **[Risco] Componentes gerados via MCP podem ter layout impreciso sem iteração** → Mitigação: gerar telas e revisar screenshot via `get_screenshot` antes de finalizar.
- **[Trade-off] Naming Flutter nos tokens é verboso no Figma** → Aceitável: o benefício de eliminar mapeamento supera o custo visual.
- **[Risco] Arquivo Library não publicado automaticamente via MCP** → Mitigação: publicar manualmente no Figma após exportação para que Login Flow consiga referenciar os componentes.

## Open Questions

- Qual será o `fileKey` do arquivo Figma de destino? (necessário para o MCP)
- O time de design vai iterar sobre os componentes, ou o output do MCP é o final?
