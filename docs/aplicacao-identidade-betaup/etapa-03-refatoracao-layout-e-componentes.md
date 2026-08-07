# Etapa 03: Refatoração dos Estilos Globais e Componentes de Chrome/Layout

## 1. Objetivo
Adequar a barra superior (Header), menu de navegação em grade (Waffle Menu), cartões institucionais, seletores de tema e componentes reutilizáveis (botões, formulários, modais e data-tables) às diretrizes visuais e tokens da marca BetaUp Soluções.

---

## 2. Ajustes de Layout e Componentes Globais

### 2.1. Header e Waffle Menu (`includes/waffle-menu.php`)
- **Top Header**: Aplicar o `Primary Gradient` (`#02A4FC` → `#0468F7` → `#271BAE` → `#310AE3`) nas áreas de destaque institucional ou manter a sobriedade com fundo `--surface` e borda inferior em `Beta Blue` (`#0468F7`).
- **Logomarca / Identidade**: Garantir que o nome da marca do desenvolvedor (BetaUp Soluções) e o produto (Domus Desk) tenham hierarquia visual limpa em tipografia Inter/Roboto, seguindo a diretriz de "tecnologia madura e estruturada".
- **Waffle Menu Items**: Atualizar os gradientes das pílulas dos módulos para usarem a escala renovada em `module-colors.php`.

### 2.2. Formulários e Botões (`assets/css/forms.css`)
- **Botão Primário (`.btn-primary`)**:
  - `background`: `var(--color-brand-primary)` (`#0468F7`)
  - `hover`: `#0286F7`
  - `focus outline`: `0 0 0 3px rgba(4, 104, 247, 0.3)`
- **Campos de Entrada (`input`, `select`, `textarea`)**:
  - Borda padrão: `var(--border)` (`#E2E8F0`)
  - Focus state: Borda `var(--color-brand-primary)` (`#0468F7`) e sombra sutil.

### 2.3. Modal e Palette Picker (Seletor de Temas)
- Atualizar as swatches do seletor de tema no menu da conta:
  - Swatch Light: Fundo `#F6F8FC` (Cloud), Ponto `#0468F7` (Beta Blue).
  - Swatch Dark: Fundo `#0B1020` (Midnight), Ponto `#02A4FC` (Beta Cyan).

---

## 3. Próximo Passo
Avançar para a **Etapa 04**, onde serão ajustados os arquivos CSS específicos de cada módulo do sistema (`inbox.css`, `tasks.css`, `knowledge.css`, etc.).

---

> **Instrução**: Ao final da etapa, crie um resumo executivo da etapa. Faça as sugestões de workflow, git, etc e não faça mais nada. Aguarde novas instruções.
