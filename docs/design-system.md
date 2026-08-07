# Design System — Domus Desk

> **Projeto:** Domus Desk (Sistema de Helpdesk / ITSM)  
> **Identidade Base:** Rodoind Transportes  
> **Arquivo CSS Principal:** [`assets/css/theme.css`](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/theme.css)  
> **Helper de Tema:** [`includes/theme.php`](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/theme.php) & [`includes/module-colors.php`](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/module-colors.php)  
> **Data de Atualização:** Agosto de 2026

---

## 1. Visão Geral e Princípios

O Design System do **Domus Desk** foi concebido para entregar uma experiência moderna, densa em informações e visualmente harmoniosa para analistas e usuários finais.

### Princípios Fundamentais:
1. **Arquitetura Baseada em Tokens (CSS Custom Properties):** Todas as cores, superfícies, bordas e estados utilizam variáveis CSS (`var(--token, fallback)`), garantindo alternância transparente entre temas (Light/Dark) via o atributo `<html data-theme="default|dark">`.
2. **Identidade Visual Corporativa (Rodoind):** O sistema adota o **Azul Marinho Profundo** como tom institucional de autoridade, o **Slate Light** para fundos com alto contraste de legibilidade, e o **Amarelo/Laranja Vibrante** para chamadas de ação primárias (CTAs).
3. **Identidade Visual por Módulo (Accent Color Layer):** Cada módulo funcional possui uma cor de sotaque (*accent color*) exclusiva registrada em [`includes/module-colors.php`](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/module-colors.php) e espelhada em tokens no CSS, permitindo rápida identificação no *Waffle Menu* e na interface interna do módulo.
4. **UX de Segurança Operacional:** Notações visuais fortes (como fundos amarelados para notas internas privadas vs. branco para respostas públicas) evitam vazamentos acidentais de informações confidenciais para clientes.

---

## 2. Paleta de Cores e Tokens de Design

O sistema possui suporte nativo a múltiplos temas (atualmente **Light** como padrão e **Dark**).

### 2.1. Cores Institucionais e Estruturais (Light vs Dark)

| Categoria | Token CSS | Modo Light (Default) | Modo Dark | Descrição / Aplicação |
| --- | --- | --- | --- | --- |
| **Fundo App** | `--app-bg` | `#F8FAFC` | `#14171C` | Fundo geral da página e áreas externas |
| **Superfície 1** | `--surface` | `#FFFFFF` | `#1E2228` | Cards, painéis, modais, formulários |
| **Superfície 2** | `--surface-2` | `#F8FAFC` | `#232830` | Superfície zebrada, elevações sutis |
| **Superfície 3** | `--surface-3` | `#F1F5F9` | `#20242B` | Cabeçalho de tabelas, áreas selecionadas |
| **Hover** | `--surface-hover` | `#F1F5F9` | `#2A3039` | Hover em itens de listas e tabelas |
| **Não Lido** | `--row-unread` | `#F0F9FF` | `#1B2733` | Destaque de linha de ticket não lido |
| **Texto Principal** | `--text` | `#0F172A` | `#E6E8EB` | Títulos, corpos de texto primários |
| **Texto Secundário** | `--text-muted` | `#64748B` | `#AAB2BD` | Rótulos, meta-informações |
| **Texto Terciário** | `--text-dim` | `#888888` | `#8D95A0` | Textos de menor relevância |
| **Texto Faint** | `--text-faint` | `#94A3B8` | `#79818B` | Placeholders, dicas inline |
| **Borda Padrão** | `--border` | `#E2E8F0` | `#343B45` | Linhas divisórias, bordas de cards |
| **Borda Suave** | `--border-soft` | `#F1F5F9` | `#2B313A` | Divisores internos sutis |
| **Brand Primary** | `--color-brand-primary` | `#0A192F` | `#0A192F` | Azul Marinho Profundo (Header/TopBar) |
| **Brand Hover** | `--color-brand-primary-hover` | `#112240` | `#112240` | Azul Marinho Intermediário |
| **Brand Accent** | `--color-brand-accent` | `#1E3A8A` | `#2B88D8` | Azul Médio Corporativo / Elementos ativos |
| **CTA Primary** | `--color-cta-primary` | `#F59E0B` | `#F59E0B` | Amarelo/Laranja Vibrante (Ação principal) |
| **CTA Hover** | `--color-cta-primary-hover` | `#D97706` | `#D97706` | Laranja Escuro para Hover de CTA |
| **CTA Text** | `--color-cta-text` | `#0F172A` | `#0F172A` | Cor de texto nos botões de CTA primário |

---

### 2.2. Badges Semânticos e Status

| Estado Semântico | Token Fundo | Token Texto | Token Borda | Aplicação Visual |
| --- | --- | --- | --- | --- |
| **Sucesso / Resolvido** | `--success-bg` (`#DCFCE7`) | `--success-text` (`#166534`) | `--success-border` (`#B7E1C4`) | Badges de aprovação, tickets resolvidos, SLA OK |
| **Perigo / Urgente** | `--danger-bg` (`#FEE2E2`) | `--danger-text` (`#991B1B`) | `--danger-border` (`#F0C2C2`) | Erros, SLA estourado, tickets urgentes |
| **Aviso / Pendente** | `--warning-bg` (`#FEF3C7`) | `--warning-text` (`#92400E`) | `--warning-border` (`#F59E0B`) | SLA em atenção (< 2h), pendências |
| **Novo / Em Aberto** | `--color-status-new` (`#0284C7`) | `#FFFFFF` | — | Tickets recém-abertos |
| **Nota Interna** | `--color-note-internal-bg` (`#FEF3C7`) | `#0F172A` | `--color-note-internal-border` (`#F59E0B`) | Caixa de atendimento privada / confidencial |

---

### 2.3. Paleta de Cores por Módulo (Accent Layer)

Cada módulo do Domus Desk possui cores de sotaque registradas no backend PHP ([`includes/module-colors.php`](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/module-colors.php)) e expostas no CSS ([`assets/css/theme.css`](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/theme.css)):

| Módulo | Identificador CSS | Cor Principal (Light) | Hover (Light) | Soft BG (Light) | Tom Dark (Accent) |
| --- | --- | --- | --- | --- | --- |
| **Tickets / Atendimento** | `--accent` | `#0A192F` | `#1E3A8A` | `#E2E8F0` | `#2B88D8` |
| **Watchtower** | `--wt-accent` | `#1E293B` | `#0F172A` | `#F1F5F9` | `#94A3B8` |
| **Assets / Ativos** | — | `#107C10` | `#0B5C0B` | — | `#34D399` |
| **Knowledge / Base de Conhecimento** | `--kb-accent` | `#8764B8` | `#6B4FA2` | `#F3EEF8` | `#A98CD8` |
| **Change Management / Mudanças** | `--cm-accent` | `#00897B` | `#00695C` | `#E0F2F1` | `#26A69A` |
| **Problem Management / Problemas** | `--pm-accent` | `#DC2626` | `#B91C1C` | `#FDE8E8` | `#F87171` |
| **Calendar / Calendário** | `--cal-accent` | `#EF6C00` | `#E65100` | `#FFF3E0` | `#FF9D4D` |
| **Morning Checks** | `--mc-accent` | `#00ACC1` | `#00838F` | `#E0F7FA` | `#26C6DA` |
| **Reporting / Relatórios** | `--rep-accent` | `#CA5010` | `#A5410A` | `#FDEEE6` | `#E8703A` |
| **Software Management** | `--sw-accent` | `#5C6BC0` | `#3F51B5` | `#E8EAF6` | `#7986CB` |
| **Forms Builder / Formulários** | `--forms-accent` | `#00897B` | `#00695C` | `#E0F2F1` | `#26A69A` |
| **CMDB** | `--cmdb-accent` | `#BE185D` | `#9D174D` | `#FCE4EC` | `#EC4899` |
| **Tasks / Tarefas** | `--tsk-accent` | `#7C3AED` | `#6D28D9` | `#F3F0FF` | `#A78BFA` |
| **Contracts / Contratos** | `--con-accent` | `#F59E0B` | `#D97706` | `#FEF3C7` | `#FBBF24` |
| **Service Status** | `--ss-accent` | `#10B981` | `#059669` | `#D1FAE5` | `#34D399` |
| **Network Mapper** | `--nm-accent` | `#06B6D4` | `#0891B2` | `#ECFEFF` | `#22D3EE` |
| **Workflows** | `--wf-accent` | `#EA580C` / `#F59E0B` | `#C2410C` | `#FEF3C7` | `#FBBF24` |
| **Process Mapper** | `--pmap-accent` | `#6366F1` | `#4F46E5` | `#EEF2FF` | `#818CF8` |
| **System Wiki** | `--wiki-accent` | `#C62828` | `#B71C1C` | `#FDECEA` | `#EF5350` |
| **LMS / Treinamento** | `--lms-accent` | `#2563EB` | `#1D4ED8` | `#EFF6FF` | `#60A5FA` |
| **System / Configurações** | `--sys-accent` | `#546E7A` | `#37474F` | `#ECEFF1` | `#90A4AE` |

---

## 3. Tipografia, Dimensões e Grade

### 3.1. Tipografia
- **Font-Family Primária (Interface):** `'Segoe UI', Tahoma, Geneva, Verdana, sans-serif`
- **Font-Family Monospaçada (Logs/Código/IDs):** `ui-monospace, Consolas, 'Courier New', monospace`
- **Tamanhos Padrão:**
  - `Títulos Principais (H1/H2):` `20px` - `24px` | Peso `600` / `700`
  - `Títulos de Seção (H3):` `14px` - `16px` | Peso `600` | Transform `uppercase` + `letter-spacing: 0.5px` (em sidebars)
  - `Corpo de Texto / Tabelas:` `13px` - `14px` | Peso `400` / `500`
  - `Rótulos e Meta-informações:` `11px` - `12px` | Peso `400`
  - `Badges e Tags:` `10px` - `11px` | Peso `600` | `text-transform: uppercase`

### 3.2. Estrutura de Layout e Dimensões Destaque
- **Header Topbar:** Altura fixa `48px` | Fundo `--color-brand-primary` (`#0A192F`)
- **Sidebar de Filtros/Módulos:** Largura fixa `280px` | Scroll independente
- **Command Palette Modal (`⌘/Ctrl-K`):** Max-width `640px` | Border-radius `12px` | Elevado via Z-Index `4000`
- **Data Table Layout:** `height: calc(100vh - 48px)` | Sticky Header Z-Index `2`

---

## 4. Componentes Globais de Interface

### 4.1. Header & Waffle Menu (Grade de Módulos)
- **Top Bar:** Contém o ícone do Waffle Menu (3x3 grid), nome do módulo atual, campo de busca global / atalho do Command Palette e perfil do analista.
- **Waffle Menu Dropdown:** Modal em grade exibindo todos os módulos do sistema com seus ícones e cores corporativas registradas no [`includes/module-colors.php`](file:///home/mmc/00_code/domus-app-suite/domus-desk/includes/module-colors.php).

### 4.2. Tabela de Dados Padronizada (`.dt-table` em [`assets/css/data-table.css`](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/data-table.css))
Componente padronizado utilizado em Assets, Tasks, Calendar, Change Management e Tickets.
- **Sticky Header:** Cabeçalho fixo no topo com fundo `--surface-3`.
- **Filtros Inline Popover (`.dt-pop`):** Popover suspenso com campo de busca e checkboxes por coluna.
- **Edição Inline (`.dt-editable`):** Campos `<input>`, `<select>` e datepickers integrados diretamente nas células com indicação de foco via `--dt-accent`.
- **Reordenação Drag-and-Drop:** Arraste de colunas e linhas.

### 4.3. Command Palette (`⌘/Ctrl-K` em [`assets/css/command-palette.css`](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/command-palette.css))
- **Launcher Global:** Disponível em qualquer tela de analista.
- **Estrutura:** Campo de busca instantânea com animação de spinner, lista de resultados agrupados por categoria e rodapé com teclas atalho em badges (`.cmdp-key`).

### 4.4. Botões e Ações (`.btn-*` e `.dt-btn`)
- **Primary CTA:** `.btn-primary` — Fundo Amarelo/Laranja (`--color-cta-primary`) com texto escuro (`--color-cta-text`).
- **Secondary Action:** `.btn-secondary` — Fundo Slate 100 (`--surface-3` / `#F1F5F9`) com texto `--text`.
- **Module Specific Action:** Botões internos de cada módulo utilizam suas respectivas variáveis `--<module>-accent`.

---

## 5. Responsividade e Adaptabilidade Mobile

Todas as regras responsivas estão contidas em [`assets/css/mobile.css`](file:///home/mmc/00_code/domus-app-suite/domus-desk/assets/css/mobile.css) sob o breakpoint `@media (max-width: 768px)`:
- **Gaveta Lateral de Navegação (Views Drawer):** A barra de navegação superior recolhe para um drawer lateral deslizante de `74vw` (máx. `300px`) ativado por um botão hambúrguer.
- **Ajustes de Touch:** Teclas de atalho e dicas de teclado são ocultadas em telas menores que `520px`.
- **Layout Adaptável:** Formulários e sidebars transitam de `flex-direction: row` para coluna única.

---

## 6. Mapeamento De/Para (Refatoração do Legado FreeITSM)

Para referência de manutenção e migração de telas legadas:

| Componente Legado | Cor Antiga (FreeITSM/Bootstrap) | Nova Cor Domus Desk (Rodoind) | Token CSS / Classe |
| --- | --- | --- | --- |
| **Topbar Header** | `#1F2937` / `#3B82F6` | `#0A192F` | `--color-brand-primary` |
| **Item Ativo Sidebar** | `#2563EB` | `#1E3A8A` | `--color-brand-accent` |
| **Botão Criar Ticket** | `#2563EB` (Azul) | `#F59E0B` (Amarelo/Laranja) | `--color-cta-primary` |
| **Fundo da Aplicação** | `#F3F4F6` | `#F8FAFC` | `--app-bg` |
| **Borda de Foco** | `#3B82F6` | `#0A192F` | `focus:border-[var(--accent)]` |
| **Nota Interna Privada** | Cinza genérico | Amarelo claro (`#FEF3C7`) | `--color-note-internal-bg` |

---

## 7. Como Utilizar no Desenvolvimento

### Inclusão nos Scripts PHP
Para carregar o tema dinâmico na página, certifique-se de incluir a biblioteca de temas no cabeçalho:

```php
require_once __DIR__ . '/includes/theme.php';
$activeTheme = Theme::active('nome_do_modulo');
```

No HTML principal (`<html data-theme="...">`):
```html
<html data-theme="<?php echo htmlspecialchars($activeTheme); ?>">
```

### Escrevendo CSS compatível com o Design System
Evite cores em hexadecimal diretamente nos arquivos CSS dos módulos. Sempre utilize os tokens:

```css
.meu-componente {
    background-color: var(--surface, #ffffff);
    color: var(--text, #0f172a);
    border: 1px solid var(--border, #e2e8f0);
}

.meu-componente-header {
    background-color: var(--accent, #0a192f);
    color: var(--on-accent, #ffffff);
}
```
