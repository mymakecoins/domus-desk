<h1 align="center">Domus Desk</h1>

<p align="center"><strong>Gestão de Serviços de TI (ITSM) gratuita e de código aberto — auto-hospedada, com IA inclusa, sem taxas por usuário. Sempre.</strong></p>

<p align="center">
<a href="https://github.com/mymakecoins/domus-desk/blob/main/LICENSE"><img src="https://img.shields.io/github/license/mymakecoins/domus-desk?style=flat-square&color=blue" alt="Licença MIT"></a>
<img src="https://img.shields.io/badge/PHP-7.4--8.4-777BB4?style=flat-square&logo=php&logoColor=white" alt="PHP 7.4–8.4">
<img src="https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=flat-square&logo=mysql&logoColor=white" alt="MySQL 8.0+">
<img src="https://img.shields.io/badge/Docker-Pronto-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Pronto para Docker">
<a href="https://github.com/mymakecoins/domus-desk/stargazers"><img src="https://img.shields.io/github/stars/mymakecoins/domus-desk?style=flat-square&color=gold" alt="Estrelas no GitHub"></a>
</p>

<p align="center">
🌍 <a href="https://domusdesk.com">domusdesk.com</a> &nbsp;·&nbsp;
📖 <a href="https://github.com/mymakecoins/domus-desk/wiki">Wiki de Documentação</a> &nbsp;·&nbsp;
💬 <a href="https://github.com/mymakecoins/domus-desk/discussions">Discussões</a> &nbsp;·&nbsp;
🐛 <a href="https://github.com/mymakecoins/domus-desk/issues">Problemas (Issues)</a>
</p>

---

O Domus Desk é uma plataforma completa de ITSM baseada em web: **21 módulos integrados** cobrindo chamados, ativos, base de conhecimento, mudanças, problemas, tarefas, CMDB, fluxos de trabalho, LMS e mais — além de um **portal de autoatendimento** para seus usuários finais. Ele roda em uma pilha simples de PHP + MySQL (WAMP, XAMPP, LAMP ou Docker), garantindo que seus dados permaneçam no seu próprio servidor.

**Por que as equipes o escolhem:**

- 🆓 **Verdadeiramente gratuito** — licença MIT, sem custos por assento/agente, sem planos "Enterprise". Tudo é entregue para todos.
- 🏠 **Auto-hospedado** — seus chamados, as conversas dos seus clientes e sua base de conhecimento residem no seu banco de dados, sob suas políticas de privacidade e backup.
- 🤖 **IA incluída, sem custos adicionais** — limpeza de respostas, Q&A na base de conhecimento, geração de formulários, autoria de cursos, rascunho de RCA e mais; tudo no modelo "traga sua própria chave" (Anthropic, OpenAI ou OpenRouter).
- 📥 **Qualquer canal vira um chamado** — e-mail (Microsoft 365, Gmail, IMAP), WhatsApp, widget de chat web incorporável e um portal que funciona até para colaboradores **sem endereço de e-mail corporativo**.

## Capturas de Tela

<table>
<tr>
<td align="center"><strong>Watchtower</strong><br><img src="https://domusdesk.com/images/screenshots/watchtower_1.png" width="350" alt="Watchtower"></td>
<td align="center"><strong>Chamados (Tickets)</strong><br><img src="https://domusdesk.com/images/screenshots/tickets_1.png" width="350" alt="Tickets"></td>
<td align="center"><strong>Ativos (Assets)</strong><br><img src="https://domusdesk.com/images/screenshots/assets_1.png" width="350" alt="Assets"></td>
</tr>
<tr>
<td align="center"><strong>Base de Conhecimento</strong><br><img src="https://domusdesk.com/images/screenshots/knowledge_1.png" width="350" alt="Knowledge"></td>
<td align="center"><strong>Mudanças</strong><br><img src="https://domusdesk.com/images/screenshots/changes_1.png" width="350" alt="Changes"></td>
<td align="center"><strong>Calendário</strong><br><img src="https://domusdesk.com/images/screenshots/calendar_1.png" width="350" alt="Calendar"></td>
</tr>
</table>

<p align="center"><a href="https://domusdesk.com/screenshots.html"><strong>Ver todas as 57 capturas de tela →</strong></a></p>

## 🚀 Início Rápido

A rota mais rápida é via Docker — sem necessidade de configurar PHP, MySQL ou servidor web manualmente:

```bash
git clone https://github.com/mymakecoins/domus-desk.git
cd domus-desk
docker compose up -d
```

Em seguida, acesse [http://localhost:8080/setup/](http://localhost:8080/setup/) para verificar a instalação e criar sua conta de administrador.

- **Instalação manual** (WAMP / XAMPP / LAMP): siga o **[Guia de Instalação](https://github.com/mymakecoins/domus-desk/wiki/Installation)** — pré-requisitos, configuração de banco de dados, chave de criptografia e arquivos de configuração.
- **Primeiro login**: `admin` / `domus_desk` — altere imediatamente no menu da conta.
- **Dados de demonstração**: Sistema → Dados de Demonstração preenche todos os módulos com dados amostrais realistas, para que você possa avaliar o sistema em funcionamento.

## Módulos

| Módulo | O que faz |
|--------|-----------|
| [Watchtower](https://github.com/mymakecoins/domus-desk/wiki/Watchtower) | Painel unificado de atenção — com um olhar veja o que precisa da sua ação em todos os módulos |
| [Tickets (Chamados)](https://github.com/mymakecoins/domus-desk/wiki/Tickets) | Caixa de entrada estilo Outlook com canais de e-mail, WhatsApp e chat web, SLAs, CSAT, respostas prontas, ações em massa, adiamento (snooze), detecção de colisão e limpeza de respostas com IA |
| [Portal de Autoatendimento](https://github.com/mymakecoins/domus-desk/wiki/Self-Service-Portal) | Portal do usuário final — catálogo de solicitações, conhecimento, respostas, gravação de tela; funciona mesmo sem e-mail |
| [Tarefas (Tasks)](https://github.com/mymakecoins/domus-desk/wiki/Tasks) | Quadro Kanban, lista, calendário e visualização de linha do tempo para trabalho interno |
| [Ativos (Assets)](https://github.com/mymakecoins/domus-desk/wiki/Assets) | Registro de ativos com rastreamento de custódia, localizações, garantias, [etiquetas QR e leitor por câmera no app para inventário](https://github.com/mymakecoins/domus-desk/wiki/Asset-QR-Labels), sincronização com vCenter e Intune |
| [Base de Conhecimento](https://github.com/mymakecoins/domus-desk/wiki/Knowledge) | Artigos em texto rico com chat IA, busca vetorial, fluxo de revisão e visibilidade por público-alvo |
| [Gestão de Mudanças](https://github.com/mymakecoins/domus-desk/wiki/Change-Management) | Mudanças no padrão ITIL com votação do CAB, matriz de risco e revisão pós-implementação |
| [Gestão de Problemas](https://github.com/mymakecoins/domus-desk/wiki/Problem-Management) | Análise de causa raiz para incidentes recorrentes, erros conhecidos e elaboração de RCA auxiliada por IA |
| [Workflows (Fluxos)](https://github.com/mymakecoins/domus-desk/wiki/Workflows) | Automação entre módulos — tela visual, mais de 138 gatilhos, webhooks de saída e coautor com IA |
| [CMDB](https://github.com/mymakecoins/domus-desk/wiki/CMDB) | Itens de configuração tipados com relacionamentos, análise de impacto e resumos por IA |
| [Mapeador de Rede](https://github.com/mymakecoins/domus-desk/wiki/Network-Mapper) | Diagramas de arquitetura onde cada nó está vinculado a um objeto real do CMDB |
| [Calendário](https://github.com/mymakecoins/domus-desk/wiki/Calendar) | Calendário da equipe com categorias e feed iCal para seu smartphone |
| [Checagens Matinais](https://github.com/mymakecoins/domus-desk/wiki/Morning-Checks) | Checagens diárias da saúde da infraestrutura com gráficos de tendência e exportação em PDF |
| [Relatórios (Reporting)](https://github.com/mymakecoins/domus-desk/wiki/Reporting) | Logs do sistema, trilha de auditoria e painel de dispositivos Intune com detalhamento (drill-down) |
| [Software](https://github.com/mymakecoins/domus-desk/wiki/Software) | Inventário de softwares via script agente, além de gestão de licenças |
| [Formulários](https://github.com/mymakecoins/domus-desk/wiki/Forms) | Construtor de formulários dinâmicos com assistência de IA, versionamento e relatórios de envios |
| [Contratos](https://github.com/mymakecoins/domus-desk/wiki/Contracts) | Ciclo de vida de fornecedores e contratos, além de construtor de RFP impulsionado por IA |
| [Status dos Serviços](https://github.com/mymakecoins/domus-desk/wiki/Service-Status) | Painel da saúde dos serviços alimentado pelo rastreamento de incidentes |
| [LMS (Treinamentos)](https://github.com/mymakecoins/domus-desk/wiki/LMS) | Crie cursos no app (com IA) ou envie arquivos SCORM; atribua, faça e acompanhe treinamentos |
| [Mapeador de Processos](https://github.com/mymakecoins/domus-desk/wiki/Process-Mapper) | Construtor de fluxogramas com raias (swimlanes), tipos de etapas customizados e exportação para Mermaid |
| [Sistema](https://github.com/mymakecoins/domus-desk/wiki/System) | Administração — analistas, equipes, papéis (RBAC), criptografia, verificação de banco de dados, dados demo |

Um módulo de **Wiki do Sistema** também documenta automaticamente o código-fonte dentro do aplicativo, e uma [extensão de navegador](https://github.com/mymakecoins/domus-desk/wiki/Browser-Extension) coloca o contador do Watchtower na barra de ferramentas do Chrome/Edge.

## Destaques

- **[API REST](https://github.com/mymakecoins/domus-desk/wiki/REST-API)** — Mais de 200 endpoints autenticados por chave com permissões granulares, especificação OpenAPI ao vivo e documentação interativa com exemplos de código em 7 linguagens.
- **[Single Sign-On (SSO)](https://github.com/mymakecoins/domus-desk/wiki/Single-Sign-On) & [LDAP / Active Directory](https://github.com/mymakecoins/domus-desk/wiki/LDAP-and-Active-Directory)** — Provedores OIDC lado a lado (Keycloak, Entra, Okta, …), ou conexão direta ao seu diretório local com provisionamento Just-in-Time regulado por grupos. Login local sempre mantido como contingência.
- **[Segurança](https://github.com/mymakecoins/domus-desk/wiki/Security)** — Criptografia AES-256-GCM em repouso para segredos, MFA via TOTP, proteção contra força bruta, permissões baseadas em funções (RBAC) até abas individuais de configurações e trilhas de auditoria em todo o sistema.
- **[Multi-tenancy](https://github.com/mymakecoins/domus-desk/wiki/Multi-Tenancy)** — Hospede múltiplas empresas clientes em uma única instalação (projetado para MSPs), cada uma isolada das demais. Invisível até que você adicione uma segunda empresa.
- **[Webhooks](https://github.com/mymakecoins/domus-desk/wiki/Webhooks)** — Envie qualquer evento para o Slack, Teams, Discord ou qualquer endpoint, com assinatura HMAC, tentativas de reenvio e painel de entregas.
- **Paleta de comandos** — Pressione **⌘K / Ctrl-K** em qualquer lugar para ir para qualquer módulo, buscar por chamados, mudanças, problemas, conhecimento, contratos, ativos e itens do CMDB por nome ou referência, ou executar uma ação rápida, tudo pelo teclado. Os resultados respeitam seu acesso de módulo e empresa ativa.
- **Internacionalização** — [21 idiomas](https://github.com/mymakecoins/domus-desk/wiki/Internationalisation) com localidade por analista, além de [fusos horários por analista](https://github.com/mymakecoins/domus-desk/wiki/Timezones-and-Time-Handling), [temas e modo escuro](https://github.com/mymakecoins/domus-desk/wiki/Theming-and-Dark-Mode), e fluxo principal [adaptado para dispositivos móveis](https://github.com/mymakecoins/domus-desk/wiki/Mobile-Friendly) — a [caixa de entrada de chamados](https://github.com/mymakecoins/domus-desk/wiki/Mobile-Friendly-Tickets) e [Ativos](https://github.com/mymakecoins/domus-desk/wiki/Mobile-Friendly-Assets) foram desenvolvidos para funcionar perfeitamente no celular sem alterar nada no desktop.

## Documentação

Tudo está disponível na **[Wiki de Documentação](https://github.com/mymakecoins/domus-desk/wiki)**:

| Guia | Conteúdo |
|------|----------|
| [Instalação](https://github.com/mymakecoins/domus-desk/wiki/Installation) | Setup em Docker e manual, pré-requisitos, arquivos de configuração |
| [Arquitetura](https://github.com/mymakecoins/domus-desk/wiki/Architecture) | Stack tecnológica, estrutura de diretórios, componentes compartilhados, convenções de BD |
| [Segurança](https://github.com/mymakecoins/domus-desk/wiki/Security) | Autenticação, camadas de autorização, criptografia, checklist para produção |
| [API REST](https://github.com/mymakecoins/domus-desk/wiki/REST-API) | Como a API pública funciona, além de guias de endpoints por módulo |
| [Referência da API](https://github.com/mymakecoins/domus-desk/wiki/API-Reference) | Endpoints internos baseados em sessão por trás da UI |

Existem também **[artigos aprofundados](https://domusdesk.com/deep-dive/)** no site cobrindo recursos individuais e o **[histórico de versões](https://domusdesk.com/updates.php)**.

**Tecnologias utilizadas:** PHP 7.4–8.4 · MySQL 8.0+ · JavaScript vanilla (sem frameworks) · TinyMCE · Apache ou qualquer servidor compatível com PHP.

## 👋 Mensagem do Mantenedor

O Domus Desk é um projeto desenvolvido por uma única pessoa — seu engajamento é o que o mantém em movimento:

- ⭐ **Se você usa o Domus Desk, por favor [deixe uma estrela no repositório](https://github.com/mymakecoins/domus-desk/stargazers)** — é o maior sinal de que o trabalho está ajudando a comunidade.
- 📬 **Feedback, ideias, bugs?** Envie um e-mail diretamente para mim em [ed@domusdesk.com](mailto:ed@domusdesk.com) — leio todas as mensagens — ou use as [Discussões](https://github.com/mymakecoins/domus-desk/discussions) e [Issues](https://github.com/mymakecoins/domus-desk/issues).
- 🌍 Mencioná-lo em [domusdesk.com](https://domusdesk.com) no Reddit, Hacker News, Spiceworks ou LinkedIn ajuda imensamente.

Contribuições são muito bem-vindas — o primeiro pull request externo foi aceito em 2026 e novos são incentivados!

## Licença

[MIT](LICENSE) — gratuito para uso comercial e pessoal.
