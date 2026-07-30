# Etapa 3: Refatoração de Ações, Botões e Controles (CTAs & Inputs)

> **Objetivo:** Atualizar todos os botões de ação principal, secundária e controles de formulários para usar a cor de ação Amarelo/Laranja Rodoind e a paleta corporativa.

---

## 1. Mapeamento de De/Para para Componentes de Interação

| Elemento / Componente | Cor Legada / Anterior | Nova Cor Rodoind | Classe CSS / Utility Sugerida |
| :--- | :--- | :--- | :--- |
| **Botão Primário / CTA (Novo Ticket)** | `#2563eb` (Azul Padrão) | `#F59E0B` (Amarelo/Laranja) | `bg-[#F59E0B] hover:bg-[#D97706] text-slate-950 font-semibold` |
| **Botão Secundário** | `#e5e7eb` (Cinza Neutro) | `#F1F5F9` (Slate 100) | `bg-slate-100 hover:bg-slate-200 text-slate-700` |
| **Botão de Ação do Agente** | `#3b82f6` (Azul) | `#0A192F` (Azul Marinho) | `bg-[#0A192F] hover:bg-[#1E3A8A] text-white` |
| **Focus Ring de Inputs** | `#3b82f6` (Azul Padrão) | `#0A192F` (Azul Marinho) | `focus:ring-2 focus:ring-[#0A192F] focus:border-transparent` |
| **Checkbox / Radio Selecionado** | `#2563eb` (Azul Padrão) | `#0A192F` ou `#F59E0B` | `text-[#0A192F] focus:ring-[#0A192F]` |

---

## 2. Passos de Execução
1. **Botões de Ação Principal (CTA):**
   - Substituir botões "Novo Chamado", "Salvar", "Criar" e primários de azul para `#F59E0B` (Amber 500).
   - Aplicar hover em `#D97706` (Amber 600) e cor de texto escuro (`#0F172A` / `slate-950`) para garantia de contraste WCAG AA.
2. **Botões Secundários:**
   - Padronizar fundo `slate-100` com texto `slate-700` e hover `slate-200`.
3. **Botões de Agente / Sistema:**
   - Botões específicos de ações administrativas/agentes utilizam a marca Azul Marinho `#0A192F` com hover em `#1E3A8A`.
4. **Controles de Formulário (`forms.css` / inputs):**
   - Atualizar estados de foco (focus border / ring) de inputs, selects e textareas de azul genérico para Azul Marinho `#0A192F`.
   - Ajustar checkboxes e radio buttons ativos.

---

## 3. Critérios de Aceite
- [ ] O botão "Novo Chamado" e CTAs primários destacam-se visualmente na cor Amarelo/Laranja `#F59E0B`.
- [ ] O contraste de texto escuro em fundo amarelo atende aos critérios WCAG AA.
- [ ] Inputs exibem highlight de foco consistente em Azul Marinho `#0A192F`.
