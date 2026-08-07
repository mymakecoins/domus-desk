# Etapa 02: Reestruturação do Sistema de Tokens no CSS (`theme.css`) e PHP (`module-colors.php`)

## 1. Objetivo
Atualizar o núcleo da definição de temas em `assets/css/theme.css` e centralizar as cores padrão dos módulos em `includes/module-colors.php` com base nos tokens oficiais da BetaUp.

---

## 2. Refatoração do `assets/css/theme.css`

### 2.1. Definições no `:root` e `[data-theme="default"]` (Light Mode)
- Substituir o bloco `--color-brand-primary` e `--accent` pelos tokens BetaUp:
```css
:root,
[data-theme="default"] {
    color-scheme: light;

    /* BetaUp Brand Core Tokens */
    --color-brand-primary:       #0468F7;   /* Beta Blue */
    --color-brand-primary-hover: #0286F7;   /* Beta Blue Hover */
    --color-brand-secondary:     #310AE3;   /* Beta Violet */
    --color-brand-accent:        #02A4FC;   /* Beta Cyan */
    --color-brand-depth:         #271BAE;   /* Core Indigo */

    --accent:                    #0468F7;
    --accent-hover:              #0286F7;
    --accent-soft:               #EFF6FF;   /* Blue scale 50 */
    --on-accent:                 #FFFFFF;

    /* BetaUp Surfaces */
    --app-bg:        #F6F8FC;   /* Cloud */
    --surface:       #FFFFFF;   /* White */
    --surface-2:     #F1F5F9;   /* Neutral scale 100 */
    --surface-3:     #E2E8F0;   /* Neutral scale 200 */
    --surface-hover: #EFF6FF;   /* Blue scale 50 */
    --row-unread:    #F0F9FF;

    /* BetaUp Text Tokens */
    --text:        #111827;     /* Ink */
    --text-muted:  #5B6472;     /* Slate */
    --text-dim:    #94A3B8;     /* Neutral scale 400 */
    --text-faint:  #CBD5E1;     /* Neutral scale 300 */

    /* Lines & Borders */
    --border:      #E2E8F0;     /* Neutral scale 200 */
    --border-soft: #F1F5F9;

    /* Gradientes da Marca */
    --gradient-primary: linear-gradient(135deg, #02A4FC 0%, #0468F7 35%, #271BAE 70%, #310AE3 100%);
    --gradient-soft:    linear-gradient(135deg, #0468F7 0%, #310AE3 100%);
}
```

### 2.2. Definições em `[data-theme="dark"]` (Dark Mode)
```css
[data-theme="dark"] {
    color-scheme: dark;

    /* BetaUp Dark Brand & Surfaces */
    --app-bg:        #0B1020;   /* Midnight */
    --surface:       #191C24;   /* Deep Night */
    --surface-2:     #272A31;   /* Graphite */
    --surface-3:     #334155;   /* Neutral scale 700 */
    --surface-hover: #1E293B;

    --text:        #FFFFFF;   /* White */
    --text-muted:  #94A3B8;   /* Neutral 400 */
    --border:      #272A31;

    --accent:        #02A4FC;   /* Beta Cyan para maior contraste no escuro */
    --accent-hover:  #38BDF8;   /* Sky Tech */
    --accent-soft:   #1E3A8A;
    --on-accent:     #FFFFFF;

    --gradient-dark: linear-gradient(180deg, #0B1020 0%, #111827 100%);
}
```

---

## 3. Refatoração do `includes/module-colors.php`
Ajustar o array `$defaultModuleColors` para usar a paleta extendida BetaUp (Blue, Violet, Indigo e Neutros com suporte funcional):

```php
$defaultModuleColors = [
    'watchtower'     => ['#111827', '#0B1020'], /* Ink -> Midnight */
    'tickets'        => ['#0468F7', '#271BAE'], /* Beta Blue -> Core Indigo */
    'assets'         => ['#19C37D', '#0F766E'], /* Success / Mint */
    'knowledge'      => ['#6D28D9', '#310AE3'], /* Electric Violet -> Beta Violet */
    'changes'        => ['#271BAE', '#1E3A8A'], /* Core Indigo */
    'problems'       => ['#EF4444', '#B91C1C'], /* Error */
    'calendar'       => ['#F5A524', '#D97706'], /* Warning / Amber */
    'morning-checks' => ['#02A4FC', '#0468F7'], /* Beta Cyan -> Beta Blue */
    'reporting'      => ['#310AE3', '#271BAE'], /* Beta Violet */
    'software'       => ['#3B82F6', '#1D4ED8'], /* Blue Scale */
    'forms'          => ['#2DD4BF', '#0F766E'], /* Mint Tech */
    'contracts'      => ['#F5A524', '#B45309'],
    'service-status' => ['#19C37D', '#047857'],
    'wiki'           => ['#6D28D9', '#4C1D95'],
    'lms'            => ['#0468F7', '#1D4ED8'],
    'process-mapper' => ['#310AE3', '#271BAE'],
    'tasks'          => ['#6D28D9', '#310AE3'],
    'cmdb'           => ['#A855F7', '#6D28D9'], /* Lilac Soft */
    'network-mapper' => ['#02A4FC', '#0284C7'],
    'workflow'       => ['#F5A524', '#C2410C'],
    'system'         => ['#5B6472', '#272A31'], /* Slate -> Graphite */
];
```

---

## 4. Próximo Passo
Avançar para a **Etapa 03**, que engloba os componentes globais da interface (Header, Waffle Menu, Modais e Botões).

---

> **Instrução**: Ao final da etapa, crie um resumo executivo da etapa. Faça as sugestões de workflow, git, etc e não faça mais nada. Aguarde novas instruções.
