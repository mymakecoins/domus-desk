# Etapa 5: Refatoração da Área de Atendimento e Chat do Chamado (UX Destaque)

> **Objetivo:** Garantir a clara diferenciação visual entre Respostas Públicas (visíveis ao cliente) e Notas Internas (privadas/confidenciais para a equipe técnica), prevenindo vazamento inadvertido de dados.

---

## 1. Mapeamento de UX & Cores no Atendimento

| Elemento | Estilo Legado / Anterior | Novo Estilo Rodoind | Objetivo de UX |
| :--- | :--- | :--- | :--- |
| **Comentário Público (Cliente)** | Fundo cinza simples | Fundo Branco (`#FFFFFF`) com borda lateral Azul Marinho (`#0A192F`) | Destacar mensagens que são enviadas e visíveis ao solicitante. |
| **Nota Interna (Privada)** | Sem distinção clara | Fundo Amarelado Suave (`#FEF3C7`) com borda Amarela (`#F59E0B`) | Alerta visual imediato de que o conteúdo é **confidencial/privado**. |

---

## 2. Passos de Execução
1. **Caixa de Entrada / Editor de Resposta:**
   - Quando a opção "Nota Interna" estiver selecionada no formulário de atendimento, alterar a cor de fundo da caixa de texto/editor para `#FEF3C7` com borda em `#F59E0B`.
   - Exibir selo/badge explícito `🔒 NOTA INTERNA (PRIVADA)` no cabeçalho do editor.
2. **Timeline de Histórico do Chamado:**
   - Atualizar os cards de mensagens públicas no histórico: fundo `#FFFFFF`, borda esquerda sólida de `4px` em `#0A192F`.
   - Atualizar os cards de notas internas no histórico: fundo `#FEF3C7`, borda esquerda sólida de `4px` em `#F59E0B`, texto de apoio em `amber-900`.
3. **Estilização CSS:**
   - Adicionar classes utilitárias no CSS do módulo de chamados (`inbox.css` / `tickets.css`):
     ```css
     .ticket-message-public {
       background-color: #ffffff;
       border-left: 4px solid var(--color-brand-primary, #0A192F);
     }
     .ticket-message-internal {
       background-color: var(--color-note-internal-bg, #FEF3C7);
       border-left: 4px solid var(--color-note-internal-border, #F59E0B);
     }
     ```

---

## 3. Critérios de Aceite
- [ ] Leitura instantânea e inequívoca de mensagens públicas vs notas internas na timeline.
- [ ] Destaque de alerta na caixa de escrita quando o agente estiver redigindo uma nota interna.
- [ ] Prevenção de erros operacionais na comunicação do Helpdesk.
