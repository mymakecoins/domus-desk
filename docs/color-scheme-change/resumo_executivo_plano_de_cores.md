# Resumo Executivo: Plano de Transição do Padrão de Cores (Design System Rodoind)

> **Projeto:** Domus Desk (Helpdesk / ITSM)  
> **Documento Base:** `de_para_cores_domus_helpdesk.md`  
> **Data de Planejamento:** Julho de 2026  
> **Status:** Aguardando Revisão e Aprovação do Usuário para Execução

---

## 1. Contexto e Objetivo

Este plano descreve a estratégia dividida em **6 etapas modulares** para realizar a migração completa do padrão visual legado (FreeITSM / Tailwind padrão) para a nova identidade visual baseada no Design System **Rodoind Transportes**.

A nova identidade baseia-se em 3 pilares:
1. **Azul Marinho Profundo (`#0A192F`):** Estrutura, autoridade, Topbar, Sidebar e Headers.
2. **Amarelo / Laranja Vibrante (`#F59E0B`):** Ações principais, CTAs ("Novo Chamado") e destaques visuais.
3. **Slate Light (`#F8FAFC`) / Branco (`#FFFFFF`):** Fundo limpo, alta legibilidade de dados e contraste adequado.

---

## 2. Estrutura das Etapas de Implementação

Foram gerados **6 documentos detalhados de orientação**, armazenados na pasta `/home/mmc/00_code/domus-desk/docs/color-scheme-change/`:

| Etapa | Arquivo Orientador | Foco Principal |
| :--- | :--- | :--- |
| **Etapa 1** | [`etapa_01_tokens_css_e_configuracao.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_01_tokens_css_e_configuracao.md) | Atualização de variáveis CSS no `assets/css/theme.css` e extensões Tailwind. |
| **Etapa 2** | [`etapa_02_estrutura_e_navegacao.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_02_estrutura_e_navegacao.md) | Refatoração visual da Topbar (`#0A192F`), Sidebar (`#0A192F`/`#1E3A8A`) e fundo (`#F8FAFC`). |
| **Etapa 3** | [`etapa_03_botoes_acoes_e_controles.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_04_status_slas_e_badges.md) | Atualização de botões CTA para `#F59E0B`, botões de agente `#0A192F` e focus rings de inputs. |
| **Etapa 4** | [`etapa_04_status_slas_e_badges.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_04_status_slas_e_badges.md) | Padronização dos badges de status (Novo: `#0284C7`, Em Andamento: `#F59E0B`, Pendente: `#D97706`, Resolvido: `#10B981`) e SLAs. |
| **Etapa 5** | [`etapa_05_atendimento_e_notas_internas.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_05_atendimento_e_notas_internas.md) | Diferenciação crítica entre Resposta Pública (fundo branco + borda azul) e Nota Interna (fundo `#FEF3C7` + borda `#F59E0B`). |
| **Etapa 6** | [`etapa_06_homologacao_e_acessibilidade.md`](file:///home/mmc/00_code/domus-desk/docs/color-scheme-change/etapa_06_homologacao_e_acessibilidade.md) | Validação de contraste WCAG AA, testes de regressão por módulo e checklist final. |

---

## 3. Matriz De / Para Resumida

```
   [ Cores Legadas ]                              [ Identidade Rodoind ]
 Header/Sidebar (#1f2937 / #111827)    ──────►   Azul Marinho (#0A192F)
 Botão Primário (#2563eb Azul)          ──────►   Amarelo/Laranja (#F59E0B)
 Background App (#f3f4f6)               ──────►   Slate Light (#F8FAFC)
 Status Aberto (#3b82f6)                ──────►   Azul Céu (#0284C7)
 Status Pendente (#8b5cf6 Roxo)         ──────►   Laranja Fechado (#D97706)
 Nota Interna (sem destaque)            ──────►   Alerta Amarelado (#FEF3C7 + #F59E0B)
```

---

## 4. Próximos Passos

1. **Revisão e Validação pelo Usuário** deste plano e dos arquivos gerados.
2. Após a sua autorização, iniciaremos sequencialmente a execução a partir da **Etapa 1**.
