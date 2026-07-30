# Etapa 1: Definição dos Tokens de Design e Atualização do CSS Base / Configurações

> **Objetivo:** Estabelecer a base do Design System Rodoind no projeto através da atualização e criação dos tokens de cores CSS globais e configurações de temas.

---

## 1. Escopo das Alterações
- Atualização do arquivo `assets/css/theme.css` com a nova paleta de variáveis CSS no bloco `:root` / `[data-theme="default"]`.
- Atualização do `tailwind.config.js` (se aplicável ao projeto) com as cores personalizadas da marca Rodoind (`rodoind.*` e `status.*`).
- Mapeamento centralizado de variáveis essenciais para ser reutilizado nos demais módulos.

## 2. Detalhamento dos Tokens CSS (`assets/css/theme.css`)

```css
:root,
[data-theme="default"] {
    color-scheme: light;

    /* Primary Brand (Rodoind) */
    --color-brand-primary: #0A192F;        /* Azul Marinho Profundo */
    --color-brand-primary-hover: #112240;  /* Azul Marinho Intermediário */
    --color-brand-accent: #1E3A8A;         /* Azul Médio Corporativo */

    /* Action / CTAs */
    --color-cta-primary: #F59E0B;          /* Amarelo / Laranja Vibrante */
    --color-cta-primary-hover: #D97706;    /* Laranja Escuro Hover */
    --color-cta-text: #0F172A;             /* Texto escuro para acessibilidade no CTA */

    /* Backgrounds & Surfaces */
    --color-bg-app: #F8FAFC;               /* Slate Light */
    --color-bg-surface: #FFFFFF;           /* Card / Modal Surface */
    --color-bg-subtle: #F1F5F9;            /* Slate 100 */

    /* Typography */
    --color-text-main: #0F172A;            /* Grafite Escuro */
    --color-text-muted: #64748B;           /* Cinza Neutro Médio */
    --color-text-on-dark: #FFFFFF;         /* Texto sobre fundos escuros */

    /* Borders & Lines */
    --color-border-light: #E2E8F0;         /* Cinza Claro */
    --color-border-dark: #334155;          /* Divisores escuros */

    /* Status Indicators */
    --color-status-new: #0284C7;
    --color-status-in-progress: #F59E0B;
    --color-status-pending: #D97706;
    --color-status-resolved: #10B981;
    --color-status-closed: #64748B;
    --color-status-urgent: #EF4444;

    /* Notes / Atendimento */
    --color-note-internal-bg: #FEF3C7;
    --color-note-internal-border: #F59E0B;
}
```

## 3. Adição em `tailwind.config.js` (se aplicável)
```javascript
module.exports = {
  theme: {
    extend: {
      colors: {
        rodoind: {
          navy: '#0A192F',
          'navy-dark': '#060D1A',
          'navy-light': '#112240',
          blue: '#1E3A8A',
          amber: '#F59E0B',
          'amber-hover': '#D97706',
          slate: '#F8FAFC',
        },
        status: {
          new: '#0284C7',
          progress: '#F59E0B',
          resolved: '#10B981',
          danger: '#EF4444',
          internal: '#FEF3C7',
        }
      }
    }
  }
}
```

## 4. Critérios de Aceite
- [ ] Todas as variáveis CSS globais atualizadas em `assets/css/theme.css`.
- [ ] Compatibilidade preservada com o seletor `[data-theme="default"]`.
- [ ] Nenhuma quebra em módulos que já consomem `var(--...)`.
