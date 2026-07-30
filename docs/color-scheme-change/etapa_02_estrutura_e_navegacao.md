# Etapa 2: Refatoração da Estrutura e Navegação (Layout & Shell)

> **Objetivo:** Aplicar a nova identidade Rodoind no "shell" da aplicação (Topbar, Sidebar, fundo de tela e containers principais).

---

## 1. Mapeamento de Alterações Visuais

| Elemento / Componente | Cor Legada / Anterior | Nova Cor Rodoind | Classe CSS / Utility Sugerida |
| :--- | :--- | :--- | :--- |
| **Header / Topbar** | `#1f2937` / `#3b82f6` (Azul/Cinza) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] text-white` |
| **Sidebar Background** | `#111827` (Grafite Escuro) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] border-r border-slate-800` |
| **Item Ativo na Sidebar** | `#2563eb` (Azul Primário) | `#1E3A8A` (Azul Médio) | `bg-[#1E3A8A] text-white font-medium` |
| **Hover na Sidebar** | `#374151` (Cinza Escuro) | `#112240` (Tom intermediário) | `hover:bg-[#112240] transition-colors` |
| **Canvas / Fundo da Página** | `#f3f4f6` / `#ffffff` | `#F8FAFC` (Slate Light) | `bg-[#F8FAFC]` / `var(--color-bg-app)` |
| **Card / Surface Container** | `#ffffff` | `#FFFFFF` (Branco) | `bg-white shadow-sm border border-slate-200` |

---

## 2. Arquivos Impactados Mapeados
- Templates de Header/Sidebar em PHP / HTML (ex: `includes/header.php`, `includes/sidebar.php` ou layouts centrais).
- Stylesheets de layout principal (`assets/css/theme.css` e CSSs estruturais).

---

## 3. Passos de Execução
1. Atualizar as classes/estilos do elemento de cabeçalho (`<header>` ou navbar) para a cor `#0A192F`.
2. Ajustar a barra lateral (Sidebar) para o fundo `#0A192F` e divisor `slate-800` (`#1E293B`).
3. Definir o estado `:hover` dos links do menu para `#112240` e o estado `.active` para `#1E3A8A`.
4. Definir o fundo padrão do `<body>` ou container principal como `var(--color-bg-app)` (`#F8FAFC`).
5. Padronizar a borda dos cards de conteúdo para `var(--color-border-light)` (`#E2E8F0`).

---

## 4. Critérios de Aceite
- [ ] Topbar e Sidebar integradas visualmente no tom Azul Marinho `#0A192F`.
- [ ] Destaque do item de menu ativo legível com a cor `#1E3A8A`.
- [ ] Fundo do sistema consistente em Slate Light `#F8FAFC`.
