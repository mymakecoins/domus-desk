# Resumo Executivo: Etapa 01 — Análise e Mapeamento de Tokens Cromáticos

A **Etapa 01** do plano de transição da identidade visual do **Domus Desk** para a marca **BetaUp Soluções** foi finalizada.

---

## 1. Mapeamento de Tokens Cromáticos (De-Para)

A especificação técnica detalhada com o de-para completo das cores legadas para a nova paleta BetaUp está registrada no arquivo:
- [etapa-01-analise-e-mapeamento-tokens.md](file:///home/mmc/00_code/domus-app-suite/domus-desk/docs/aplicacao-identidade-betaup/etapa-01-analise-e-mapeamento-tokens.md)

### Resumo da Matriz de Transformação
* **Brand Primary**: `#0A192F` (Rodoind Navy) $\rightarrow$ **`#0468F7`** (`Beta Blue` / `brand.primary`)
* **Brand Secondary**: `#112240` (Dark Navy) $\rightarrow$ **`#310AE3`** (`Beta Violet` / `brand.secondary`)
* **Brand Accent**: `#1E3A8A` (Medium Corporate Blue) $\rightarrow$ **`#02A4FC`** (`Beta Cyan` / `brand.accent`)
* **Brand Depth**: `#0A192F` $\rightarrow$ **`#271BAE`** (`Core Indigo` / `brand.depth`)
* **CTA Primary**: `#F59E0B` (Amber) $\rightarrow$ **`#0468F7`** (`Beta Blue`)
* **Surfaces (Light Mode)**: Fundo geral `#F8FAFC` $\rightarrow$ **`#F6F8FC`** (`Cloud`)
* **Surfaces (Dark Mode)**: Painéis escuros $\rightarrow$ **`#191C24`** (`Deep Night`), Fundo geral $\rightarrow$ **`#0B1020`** (`Midnight`)
* **Cores Semânticas**:
  * Success: `#19C37D` (Fundo `#DCFCE7`)
  * Warning: `#F5A524` (Fundo `#FEF3C7`)
  * Error: `#EF4444` (Fundo `#FEE2E2`)
  * Info: `#3B82F6` (Fundo `#DBEAFE`)

---

## 2. Inventário de Arquivos que Referenciam Cores Legadas

### 🎨 Arquivos CSS (`assets/css/`)
1. [theme.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/theme.css) — **[CRÍTICO]** Declaração central das variáveis CSS (`:root`, `[data-theme="default"]`, `[data-theme="dark"]`).
2. [inbox.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/inbox.css) — Estilização da lista de chamados, filtros e badges.
3. [calendar.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/calendar.css) / [calendar-grid.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/calendar-grid.css) / [itsm_calendar.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/itsm_calendar.css) — Utiliza cores legadas de fallback (`#0078d4`).
4. [change-management.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/change-management.css), [forms.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/forms.css), [knowledge.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/knowledge.css), [lms.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/lms.css), [process-mapper.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/process-mapper.css), [tasks.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/tasks.css), [workflow.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/workflow.css) — Módulos com acentos específicos a serem revisados.
5. [mobile.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/mobile.css), [self-service.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/self-service.css), [command-palette.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/command-palette.css), [data-table.css](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/data-table.css).

### 🐘 Arquivos PHP & Scripts Backend (`includes/`, `api/`, etc.)
1. [module-colors.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/module-colors.php) — **[CRÍTICO]** Matriz de cores por módulo (incluindo o par legados do módulo *tickets*: `['#0A192F', '#1E3A8A']`).
2. [waffle-menu.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/waffle-menu.php) — Renderização dos ícones/gradientes dos módulos.
3. [header.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/header.php) & [theme.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/theme.php) — Injeção de variáveis de tema e cabeçalho dinâmico.
4. [request_password_reset.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/api/auth/request_password_reset.php) — Template de e-mail com gradient inline `#0A192F` / `#1E3A8A`.
5. [db_verify.php](file:///home/mmc/00_code/domus-app-suite/domus-desk/api/system/db_verify.php) — Seeds de status e prioridades do banco de dados.

---

## 3. Sugestões de Workflow & Git

* **Branch Recomendada**: `feature/betaup-identity-phase-01`
* **Convenção de Commits**:
  * `docs(theme): adiciona mapeamento e inventario de tokens betaup (etapa 01)`
* **Estratégia de Execução da Próxima Etapa**:
  * **Etapa 02** ([etapa-02-reestruturacao-tokens-theme.md](file:///home/mmc/00_code/domus-app-suite/domus-desk/docs/aplicacao-identidade-betaup/etapa-02-reestruturacao-tokens-theme.md)): Atualização das variáveis em `assets/css/theme.css` e da estrutura em `includes/module-colors.php`.
