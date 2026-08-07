# Etapa 05: Homologação, Contraste/Acessibilidade (WCAG) e Validação Visual

## 1. Objetivo
Garantir que a nova identidade cromática da BetaUp aplicada ao Domus Desk atenda aos critérios globais de acessibilidade (WCAG 2.1 AA/AAA), mantenha a integridade visual nos modos Claro e Escuro (Light/Dark Mode) e seja validada sem regressões de UI.

---

## 2. Checklist de Validação de Acessibilidade (WCAG)

### 2.1. Razão de Contraste para Texto em Relação ao Fundo
- **Texto Primário (`Ink` `#111827` sobre `White` `#FFFFFF`)**: Contraste 16.1:1 (Aprovado AAA).
- **Texto Primário (`Ink` `#111827` sobre `Cloud` `#F6F8FC`)**: Contraste 15.2:1 (Aprovado AAA).
- **Texto Secundário (`Slate` `#5B6472` sobre `White` `#FFFFFF`)**: Contraste 5.4:1 (Aprovado AA para corpo e AAA para textos grandes).
- **Botão Primário (`White` `#FFFFFF` sobre `Beta Blue` `#0468F7`)**: Contraste 4.6:1 (Aprovado AA).
- **Modo Escuro (`White` `#FFFFFF` sobre `Deep Night` `#191C24`)**: Contraste 16.5:1 (Aprovado AAA).
- **Modo Escuro (`Beta Cyan` `#02A4FC` sobre `Midnight` `#0B1020`)**: Contraste 9.8:1 (Aprovado AAA).

---

## 3. Matriz de Homologação Visual

1. **Troca Dinâmica de Temas**:
   - Alternar entre Light Mode e Dark Mode via seletor de tema na barra do usuário.
   - Verificar se todas as superfícies, bordas e textos reagem corretamente sem sobressaltos ou cores legadas.
2. **Validação por Navegador e Dispositivo**:
   - Testar a responsividade e renderização dos gradientes e botões nos principais navegadores (Chrome, Firefox, Safari, Edge).
3. **Inspeção de Contraste e Elementos de Estado**:
   - Validar se os alertas e badges de status (`Success`, `Warning`, `Error`, `Info`) permanecem legíveis tanto em telas claras quanto escuras.

---

## 4. Critério de Aceite da Transição
- 0% de ocorrência dos códigos hexadecimais legados da Rodoind (`#0A192F`, `#112240`).
- 100% dos componentes baseados nos novos tokens da marca BetaUp.
- Aprovação sem erros no validador sintático de CSS e testes de sintaxe PHP.

---

> **Instrução**: Ao final da etapa, crie um resumo executivo da etapa. Faça as sugestões de workflow, git, etc e não faça mais nada. Aguarde novas instruções.
