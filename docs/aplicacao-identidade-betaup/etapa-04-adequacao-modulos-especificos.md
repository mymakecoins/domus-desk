# Etapa 04: Adequação Visual dos Módulos Específicos do Domus Desk

## 1. Objetivo
Refatorar as folhas de estilo dos módulos específicos para remover cores hardcoded legadas e garantir total coerência com o design system cromático da BetaUp.

---

## 2. Módulos e Folhas de Estilo a Serem Adequadas

| Módulo | Arquivo CSS | Principais Trocas e Tokens Utilizados |
|---|---|---|
| **Tickets / Inbox** | `assets/css/inbox.css` | Rótulos de SLA, badges de status, fundo de e-mail/chat (`--channel-bg`), tiques não lidos com tint `#EFF6FF` (`Beta Blue 50`). |
| **Tarefas (Tasks)** | `assets/css/tasks.css` | Accents do Kanban e lista trocados para `--tsk-accent: #310AE3` (`Beta Violet`), cards com fundo `--surface`. |
| **Base de Conhecimento** | `assets/css/knowledge.css` | Chat de IA e destaques de artigos atualizados para a escala de Violet/Indigo (`--kb-accent: #271BAE`). |
| **Gestão de Mudanças** | `assets/css/change-management.css` | Filtros de CAB e status de risco adequados para o padrão de alertas BetaUp (`Success`, `Warning`, `Error`). |
| **Mapeamento de Processos** | `assets/css/process-mapper.css` | Canvas e conexões com destaque `Beta Cyan` (`#02A4FC`) e `Beta Blue` (`#0468F7`). |
| **Workflows** | `assets/css/workflow.css` | Conectores, nós ativados e barra de ação migrados para os tokens funcionais. |
| **Portal de Autoatendimento** | `assets/css/self-service.css` | Hero section adaptada ao `Primary Gradient` (`#02A4FC` → `#0468F7` → `#310AE3`), cards de serviços limpos com bordas `#E2E8F0`. |
| **Calendário ITSM** | `assets/css/calendar.css`, `itsm_calendar.css` | Chips de eventos e indicador de "hoje" alinhados a `--cal-accent: #F5A524`. |

---

## 3. Diretrizes de Uso Cromático nos Módulos (Brandbook V1)
- **Hierarquia Visual**: Usar azul (`#0468F7`) como a cor de ação principal em todos os módulos e violeta (`#310AE3`) para elementos secundários ou diferenciação visual.
- **Leitura Limpa**: Manter fundos de tabelas e leitura em neutros limpos (`#FFFFFF` ou `#F6F8FC` em modo claro; `#191C24` em modo escuro).
- **Uso Restrito de Gradientes**: Gradientes primários restritos a cabeçalhos institucionais, banners e heros do portal de autoatendimento; telas operacionais densas usam cores sólidas e alto contraste.

---

## 4. Próximo Passo
Avançar para a **Etapa 05**, que envolve a verificação de contraste WCAG, homologação técnica e testes visuais de regressão.

---

> **Instrução**: Ao final da etapa, crie um resumo executivo da etapa. Faça as sugestões de workflow, git, etc e não faça mais nada. Aguarde novas instruções.
