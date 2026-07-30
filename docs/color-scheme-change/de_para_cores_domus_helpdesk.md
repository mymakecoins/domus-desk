# Documento de Especificação: De/Para de Cores (Refatoração de Tema)

> **Projeto:** Sistema de Helpdesk / ITSM (Baseado em FreeITSM)  
> **Objetivo:** Mapeamento completo e substituição de cores legadas/padrão do repositório para o Design System baseado na identidade visual da **Rodoind Transportes**.  
> **Data:** Julho de 2026  
> **Status:** Pronto para Implementação  

---

## 1. Visão Geral da Paleta de Cores (Design System Rodoind)

A identidade visual adotada utiliza o **Azul Marinho Corporativo** como cor estrutural de alta confiança, **Cinza Neutro Slate** para fundos e legibilidade de dados densos, e o **Amarelo/Laranja Vibrante** como cor de ação principal (CTA) e destaques funcionais.

| Papel no Sistema | Nome da Cor | Hex / Valor | Uso Principal |
| :--- | :--- | :--- | :--- |
| **Primary Brand** | Azul Marinho Profundo | `#0A192F` | Topbar, Sidebar, Headers de Tabela, Modais |
| **Primary Light / Accent** | Azul Médio Corporativo | `#1E3A8A` | Elementos ativos, hovers de menu, links primários |
| **Action / CTA** | Amarelo / Laranja Vibrante | `#F59E0B` | Botão "Novo Chamado", ações primárias, destaques |
| **Action Hover** | Laranja Escuro | `#D97706` | Estado de hover nos botões de ação principal |
| **Background (App)** | Slate Light | `#F8FAFC` | Fundo geral da aplicação e área de conteúdo |
| **Surface / Card** | Branco Puro | `#FFFFFF` | Cards, modais, formulários, linhas de tabela |
| **Text Primary** | Grafite Escuro | `#0F172A` | Títulos, textos principais, valores de tabelas |
| **Text Secondary** | Cinza Neutro Médio | `#64748B` | Labels, subtítulos, timestamps, meta-informações |
| **Borders / Lines** | Cinza Claro | `#E2E8F0` | Dividers, bordas de cards, linhas de tabelas |

---

## 2. Tabela De / Para: Cores Genéricas / Bootstrap / Tailwind → Padrão Rodoind

Abaixo está o mapeamento exato das classes de utilitários e valores CSS legados do **FreeITSM** para a nova paleta do projeto:

### 2.1. Estrutura e NAVEGAÇÃO (Layout & Shell)

| Elemento / Componente | Cor Original / Legada (FreeITSM) | Nova Cor (Rodoind) | Classe CSS / Tailwind Sugerida |
| :--- | :--- | :--- | :--- |
| **Header / Topbar** | `#1f2937` ou `#3b82f6` (Azul/Cinza Genérico) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] text-white` |
| **Sidebar Background** | `#111827` (Preto/Grafite) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] border-r border-slate-800` |
| **Item Ativo na Sidebar** | `#2563eb` (Azul Primário) | `#1E3A8A` (Azul Médio Accent) | `bg-[#1E3A8A] text-white font-medium` |
| **Hover de Item da Sidebar** | `#374151` (Cinza Escuro) | `#112240` (Tom intermediário) | `hover:bg-[#112240] transition-colors` |
| **Canvas / Fundo da Página** | `#f3f4f6` ou `#ffffff` | `#F8FAFC` (Slate Light) | `bg-[#F8FAFC]` |
| **Card / Container Surface** | `#ffffff` | `#FFFFFF` (Branco) | `bg-white shadow-sm border border-slate-200` |

---

### 2.2. Ações, Botões e Controles (CTAs & Inputs)

| Elemento / Componente | Cor Original / Legada | Nova Cor (Rodoind) | Classe CSS / Tailwind Sugerida |
| :--- | :--- | :--- | :--- |
| **Botão Primário / Novo Ticket**| `#2563eb` (Azul Padrão) | `#F59E0B` (Amarelo/Laranja) | `bg-[#F59E0B] hover:bg-[#D97706] text-slate-950 font-semibold` |
| **Botão Secundário** | `#e5e7eb` (Cinza Neutro) | `#F1F5F9` (Slate 100) | `bg-slate-100 hover:bg-slate-200 text-slate-700` |
| **Botão de Ação do Agente** | `#3b82f6` (Azul) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] hover:bg-[#1E3A8A] text-white` |
| **Border de Focus em Input** | `#3b82f6` (Azul) | `#0A192F` (Azul Marinho) | `focus:ring-2 focus:ring-[#0A192F] focus:border-transparent` |
| **Checkbox / Radio Selected** | `#2563eb` (Azul) | `#F59E0B` ou `#0A192F` | `text-[#0A192F] focus:ring-[#0A192F]` |

---

### 2.3. Status de Chamados, SLAs e Notificações

| Status / Estado | Cor Legada | Nova Cor Rodoind | Aplicação Visual / Badges |
| :--- | :--- | :--- | :--- |
| **Status: Novo / Aberto** | `#3b82f6` (Azul) | `#0284C7` (Azul Céu) | `bg-sky-100 text-sky-800 border-sky-300` |
| **Status: Em Andamento** | `#f59e0b` (Amarelo) | `#F59E0B` (Amarelo/Laranja) | `bg-amber-100 text-amber-900 border-amber-300` |
| **Status: Pendente / Aguardando**| `#8b5cf6` (Roxo) | `#D97706` (Laranja Fechado) | `bg-orange-100 text-orange-800 border-orange-300` |
| **Status: Resolvido / Concluído**| `#10b981` (Verde) | `#10B981` (Verde Esmeralda) | `bg-emerald-100 text-emerald-800 border-emerald-300` |
| **Status: Cancelado / Fechado** | `#6b7280` (Cinza) | `#64748B` (Slate Grey) | `bg-slate-100 text-slate-700 border-slate-300` |
| **SLA: Normal / Ok** | `#10b981` | `#10B981` (Verde) | Badge / Timer Verde |
| **SLA: Atenção (< 2 horas)** | `#f59e0b` | `#F59E0B` (Amarelo) | Badge / Timer Amarelo |
| **SLA: Estourado / Crítico** | `#ef4444` | `#EF4444` (Vermelho) | Badge / Timer Vermelho com destaque em negrito |

---

### 2.4. Área de Atendimento & Chat do Chamado (UX Destaque)

Para evitar erros operacionais graves no Helpdesk (como enviar notas privadas para o cliente):

| Elemento | Cor / Estilo Anterior | Novo Estilo Rodoind | Objetivo de UX |
| :--- | :--- | :--- | :--- |
| **Comentário Público (Cliente)**| Fundo cinza simples | Fundo Branco (`#FFFFFF`) com borda lateral Azul (`#0A192F`) | Destaca mensagens visíveis para o solicitante. |
| **Nota Interna (Privada)** | Sem distinção clara | Fundo Amarelado Suave (`#FEF3C7`) com borda Amarela (`#F59E0B`) | Alerta visual imediato de que a nota é **confidencial/privada**. |

---

## 3. Arquivo de Configuração de Tokens de Design

### 3.1. Variáveis CSS Globais (`variables.css` ou `globals.css`)

```css
:root {
  /* Brand Colors - Rodoind */
  --color-brand-primary: #0A192F;
  --color-brand-primary-hover: #112240;
  --color-brand-accent: #1E3A8A;
  
  /* Action / CTAs */
  --color-cta-primary: #F59E0B;
  --color-cta-primary-hover: #D97706;
  --color-cta-text: #0F172A;

  /* Backgrounds & Surfaces */
  --color-bg-app: #F8FAFC;
  --color-bg-surface: #FFFFFF;
  --color-bg-subtle: #F1F5F9;

  /* Typography */
  --color-text-main: #0F172A;
  --color-text-muted: #64748B;
  --color-text-on-dark: #FFFFFF;

  /* Borders & Dividers */
  --color-border-light: #E2E8F0;
  --color-border-dark: #334155;

  /* Status Indicators */
  --color-status-new: #0284C7;
  --color-status-in-progress: #F59E0B;
  --color-status-resolved: #10B981;
  --color-status-urgent: #EF4444;
  --color-note-internal-bg: #FEF3C7;
  --color-note-internal-border: #F59E0B;
}
```

---

### 3.2. Configuração do Tailwind CSS (`tailwind.config.js`)

Se o projeto utilizar Tailwind CSS, adicione estas extensões no tema:

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

---

## 4. Checklist para a Equipe de Desenvolvimento

- [ ] Subtituir todas as instâncias do azul legado (`#2563eb` e `#3b82f6`) na navegação principal por `rodoind.navy` (`#0A192F`).
- [ ] Atualizar o botão principal de criação de chamados/ações primárias para a cor de destaque `rodoind.amber` (`#F59E0B`).
- [ ] Implementar a diferenciação de cores nas caixas de diálogo do ticket (Nota Interna em tom amarelado vs. Resposta Pública em branco/azul).
- [ ] Atualizar os componentes de badges/tags na listagem de chamados para as cores mapeadas na seção 2.3.
- [ ] Testar contraste e acessibilidade (WCAG AA) para textos escuros em botões amarelos e textos brancos no cabeçalho azul marinho.
