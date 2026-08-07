# Etapa 01: Análise e Mapeamento de Tokens Cromáticos

## 1. Objetivo
Mapear integralmente a arquitetura visual e cromática existente no sistema **Domus Desk** e estabelecer o de-para (matriz de correspondência) com os **Tokens de Cor da BetaUp Soluções** (conforme definidos no `beta_up_design_tokens_palette.md` e alinhados ao `beta_up_brandbook_v1.pdf`).

---

## 2. Diagnóstico da Identidade Atual do Domus Desk
Atualmente, o sistema utiliza referências da marca legada (Rodoind) no arquivo `assets/css/theme.css`:
- **Azul Marinho Profundo** (`#0A192F`) como `--color-brand-primary` e `--accent`.
- **Azul Médio Corporativo** (`#1E3A8A`) como `--accent-hover`.
- **Amarelo / Laranja Vibrante** (`#F59E0B`) como `--color-cta-primary`.
- Modificadores aleatórios de cor por módulo em `includes/module-colors.php`.

---

## 3. Matriz de Correspondência (De-Para)

### 3.1. Núcleo da Marca (Brand Tokens)
| Conceito no Sistema | Valor Atual (Rodoind/Legado) | Novo Token BetaUp | Novo Hex Hexadecimal | Aplicação Principal |
|---|---|---|---|---|
| Primary Brand | `#0A192F` | `Beta Blue` (`brand.primary`) | `#0468F7` | Botões primários, navegação ativa, CTAs |
| Secondary Brand | `#112240` | `Beta Violet` (`brand.secondary`) | `#310AE3` | Destaques secundários, badges ativos |
| Accent / Innovation | `#1E3A8A` | `Beta Cyan` (`brand.accent`) | `#02A4FC` | Highlights de interface, focos, brilhos |
| Depth / Backgrounds | `#0A192F` | `Core Indigo` (`brand.depth`) | `#271BAE` | Overlays, headers de alta densidade |

### 3.2. Neutros da Interface (Light & Dark Surfaces)
| Token Semântico | Hex BetaUp | Uso no Domus Desk (Light Mode) | Uso no Domus Desk (Dark Mode) |
|---|---|---|---|
| `surface.subtle` / `Cloud` | `#F6F8FC` | `--app-bg` (Fundo geral de telas) | N/A |
| `surface.default` / `White` | `#FFFFFF` | `--surface` (Cards, tabelas, modais) | N/A |
| `surface.dark` / `Deep Night` | `#191C24` | N/A | `--surface` (Paineis escuros) |
| `surface.deep` / `Midnight` | `#0B1020` | N/A | `--app-bg` (Fundo geral dark mode) |
| `text.primary` / `Ink` | `#111827` | `--text` (Corpo de texto primário) | `--text` no escuro (`#FFFFFF` / `#F8FAFC`) |
| `text.secondary` / `Slate` | `#5B6472` | `--text-muted` (Rótulos, ícones) | `--text-muted` (`#94A3B8`) |
| `border.default` | `#E2E8F0` | `--border` (Bordas de cards e linhas) | `--border` (`#272A31`) |

### 3.3. Cores Funcionais e de Estado
| Estado Semântico | Token BetaUp | Hex Base | Soft Hex (Fundo) | Aplicação em Badges e Alerts |
|---|---|---|---|---|
| Sucesso / Concluído | `Success` | `#19C37D` | `#DCFCE7` | Tickets Resolvidos, Status Positivo |
| Alerta / Pendência | `Warning` | `#F5A524` | `#FEF3C7` | Tickets Em Andamento, Mudanças Pendentes |
| Erro / Falha | `Error` | `#EF4444` | `#FEE2E2` | SLA Estourado, Erro de Validação |
| Informação / Neutro | `Info` | `#3B82F6` | `#DBEAFE` | Novos Registros, Ajuda da Plataforma |

---

## 4. Entregáveis desta Etapa
1. Arquivo de especificação de mapeamento cromático completo (`etapa-01-analise-e-mapeamento-tokens.md`).
2. Inventário de todos os arquivos CSS e PHP que referenciam cores legadas.

---

## 5. Próximo Passo
Avançar para a **Etapa 02**, onde será feita a reestruturação física das variáveis CSS em `assets/css/theme.css` e no arquivo de backend `includes/module-colors.php`.

---

> **Instrução**: Ao final da etapa, crie um resumo executivo da etapa. Faça as sugestões de workflow, git, etc e não faça mais nada. Aguarde novas instruções.
