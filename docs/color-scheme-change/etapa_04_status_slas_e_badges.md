# Etapa 4: Refatoração de Status de Chamados, SLAs e Badges

> **Objetivo:** Reformular os componentes visuais de indicação de estado (status de chamados, tags, contadores de SLA e notificações) de acordo com a taxonomia visual Rodoind.

---

## 1. Mapeamento de Status e SLAs

| Status / Estado | Cor Legada | Nova Cor Rodoind | Aplicação Visual / Badges (Tailwind / CSS) |
| :--- | :--- | :--- | :--- |
| **Status: Novo / Aberto** | `#3b82f6` (Azul Padrão) | `#0284C7` (Azul Céu) | `bg-sky-100 text-sky-800 border-sky-300` |
| **Status: Em Andamento** | `#f59e0b` (Amarelo) | `#F59E0B` (Amarelo/Laranja) | `bg-amber-100 text-amber-900 border-amber-300` |
| **Status: Pendente / Aguardando**| `#8b5cf6` (Roxo) | `#D97706` (Laranja Fechado) | `bg-orange-100 text-orange-800 border-orange-300` |
| **Status: Resolvido / Concluído**| `#10b981` (Verde) | `#10B981` (Verde Esmeralda) | `bg-emerald-100 text-emerald-800 border-emerald-300` |
| **Status: Cancelado / Fechado** | `#6b7280` (Cinza) | `#64748B` (Slate Grey) | `bg-slate-100 text-slate-700 border-slate-300` |
| **SLA: Normal / Ok** | `#10b981` | `#10B981` (Verde) | Badge / Timer Verde |
| **SLA: Atenção (< 2 horas)** | `#f59e0b` | `#F59E0B` (Amarelo) | Badge / Timer Amarelo |
| **SLA: Estourado / Crítico** | `#ef4444` | `#EF4444` (Vermelho) | Badge / Timer Vermelho (negrito/destaque) |

---

## 2. Passos de Execução
1. **Badges de Status de Chamados:**
   - Atualizar a renderização das pílulas/badges na listagem de chamados (`tickets/index.php`, `tickets/list.php`, data-tables, etc.).
   - Mapear o status "Novo/Aberto" de azul royal `#3b82f6` para Azul Céu `#0284C7`.
   - Ajustar "Pendente" de roxo `#8b5cf6` para Laranja Fechado `#D97706`.
2. **Indicadores de SLA:**
   - Padronizar os temporizadores de SLA e badges em três níveis: Normal (Verde `#10B981`), Atenção (Amarelo `#F59E0B`), Estourado/Crítico (Vermelho `#EF4444`).
3. **Pílulas de Filtro e Contadores:**
   - Atualizar contadores no dashboard e filtros rápidos para usarem fundos suaves (`*-100`) com texto e bordas correspondentes (`*-800` / `*-300`).

---

## 3. Critérios de Aceite
- [ ] Badges de status da tabela de chamados utilizam a nova paleta sem ambiguidades visuais.
- [ ] Indicadores de SLA refletem os 3 estados claramente identificáveis.
- [ ] Eliminação de cores legadas (como o roxo `#8b5cf6` para status pendente).
