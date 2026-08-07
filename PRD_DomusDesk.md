# PRD/ERS: Domus Desk

**Versão:** 1.0  
**Data:** Julho/2026  
**Autor:** Equipe de Produto (Analista de Requisitos + Gerente de Projeto + UX/UI + QA)  
**Status:** Documentação reconstituída a partir do código-fonte existente em 30 de julho de 2026  

---

## 1. Visão do Produto

### 1.1. Propósito
Oferecer uma plataforma de Gestão de Serviços de TI (ITSM) web, auto-hospedada, modular, de código aberto e sem cobrança por licença ou por usuário, integrando automação, inteligência artificial (BYOK) e governança ITIL.

### 1.2. Nome Oficial
**Domus Desk** *(licença MIT, mantido por MyMakeCoins / Comunidade)*.

### 1.3. Problema que Resolve
- **Alto custo de licenciamento por assento/agente:** Soluções ITSM proprietárias cobram valores elevados por analista, inviabilizando a escala para pequenas e médias empresas *(inferido a partir da proposta no README.md)*.
- **Silos de informação entre gestão de chamados, ativos e mudanças:** Sistemas legados tratam inventário, tickets, CMDB e treinamentos em plataformas separadas, dificultando o rastreamento do ciclo de vida dos serviços *(inferido a partir dos 21 módulos integrados em um único esquema SQL)*.
- **Privacidade de dados e soberania da informação:** Requisitos de compliance exigem que conversas de suporte, contratos e base de conhecimento permaneçam sob infraestrutura própria e políticas de backup do cliente.
- **Dificuldade de atendimento multicanal:** Chamados espalhados em e-mails, formulários web e WhatsApp sem SLA ou triagem unificada.

### 1.4. Público-Alvo
- **Equipes de TI Internas (SMB a Enterprise):** Departamentos de suporte, infraestrutura e operações de TI que buscam centralizar atendimento e governança.
- **Provedores de Serviços Gerenciados (MSPs):** Empresas que prestam suporte a múltiplos clientes corporativos mantendo o isolamento de dados por cliente (multi-tenancy) *(inferido a partir de `tenants` e `analyst_tenant_access`)*.
- **Colaboradores / Solicitantes Finais:** Usuários da organização que necessitam de portal de autoatendimento, abertura de chamados sem e-mail corporativo ou consumo de artigos da base de conhecimento.

### 1.5. Proposta de Valor
Plataforma ITSM completa e auto-hospedada com 21 módulos nativos, integração com múltiplos provedores de IA (Anthropic, OpenAI, OpenRouter via BYOK), suporte nativo a multi-tenancy, automação visual de fluxos de trabalho com +138 gatilhos, e API REST pública OpenAPI v1 — tudo sob a licença MIT sem qualquer custo de licença por usuário.

---

## 2. Contexto Atual

### 2.1. Processo Atual
Organizações sem uma ferramenta ITSM centralizada gerenciam solicitações via trocas de e-mail desestruturadas, planilhas para inventário de ativos e mensagens instantâneas sem controle de SLA, sem histórico de auditoria e sem métricas de satisfação (CSAT) *(inferido a partir dos canais e relatórios implementados)*.

### 2.2. Principais Dores
| Dor | Impacto |
|-----|--------|
| Perda de prazos e violação de SLA | Insatisfação dos usuários, ausência de alertas antes da quebra do SLA e falta de priorização clara dos chamados. |
| Fragmentação de ferramentas (Ativos vs Chamados vs Mudanças) | Impossibilidade de correlacionar um incidente ao ativo afetado, ao item de configuração no CMDB ou a uma alteração recente. |
| Custos recorrentes e imprevisíveis de software em nuvem | Restrição de crescimento da equipe de atendimento devido ao custo incremental por licença de analista. |
| Riscos de segurança e vazamento de segredos em integrações | Credenciais de e-mail, tokens OAuth e chaves de IA armazenadas sem criptografia em banco de dados ou arquivos públicos *(resolvido pelo uso de AES-256-GCM fora da raiz web)*. |

### 2.3. Oportunidades
- Centralização de 21 áreas funcionais em uma única aplicação web monolítica eficiente.
- Adoção de Inteligência Artificial pragmática para tarefas de triagem, rascunho de causa raiz (RCA), resposta a chamados e auxílio na elaboração de contratos/RFP.
- Redução drástica do tempo de integração com diretórios corporativos (OIDC, LDAP / Active Directory com provisionamento JIT).

---

## 3. Usuários e Personas

### 3.1. Persona 1: Analista de TI / Atendente (Helpdesk / Service Desk)
- **Experiência:** Intermediária a avançada em suporte técnico.
- **Objetivo:** Atender chamados rapidamente, ter visibilidade das suas pendências diárias e evitar duplicação de atendimento (colisão).
- **Dor Principal:** Falta de contexto do usuário e histórico do ativo durante o atendimento, perda de tempo redigindo respostas repetitivas.
- **Necessidade:** Painel unificado (Watchtower), respostas prontas (canned replies), detecção de presença simultânea no chamado, automação de limpeza de respostas com IA.

### 3.2. Persona 2: Gestor de TI / Coordenador de Operações
- **Experiência:** Gestão de processos ITIL, governança de serviços e contratos.
- **Objetivo:** Garantir cumprimento de SLAs, gerenciar mudanças de infraestrutura via CAB, acompanhar indicadores de CSAT e controlar licenças de software.
- **Dor Principal:** Falta de visibilidade dos gargalos operacionais e falta de controle sobre auditoria e permissões dos analistas.
- **Necessidade:** Controle de acesso granular (RBAC por abas e módulos), relatórios configuráveis, matriziamento de riscos em mudanças, gestão de fornecedores e auditoria completa.

### 3.3. Persona 3: Colaborador Final / Solicitante
- **Experiência:** Variada (usuário leigo ou administrativo).
- **Objetivo:** Solicitar suporte ou serviços de TI de forma simples e rápida, sem burocracia.
- **Dor Principal:** Falta de acompanhamento do status da solicitação e formulários complexos ou inacessíveis para quem não possui e-mail corporativo.
- **Necessidade:** Portal de autoatendimento responsivo, catálogo de serviços intuitivo, chat web incorporável, gravação de tela integrada na abertura de chamados.

---

## 4. Jornada do Usuário

### 4.1. Jornada Atual (Sem a Solução Reconstituída)
```
1. Solicitante envia e-mail ou mensagem informal solicitando suporte.
2. Analista recebe a mensagem no e-mail pessoal/equipe sem número de protocolo ou prioridade.
3. Atendimento é realizado sem registro de tempo, sem vínculo com o ativo e sem cálculo de SLA.
4. Mudança de configuração é realizada em servidor sem aprovação do CAB ou registro no CMDB.
5. Gestão fica sem métricas de satisfação ou histórico para análise de causa raiz (RCA).
```

### 4.2. Jornada Futura (Com o Domus Desk)
```
1. Solicitante abre o chamado via Portal de Autoatendimento, e-mail (M365/Gmail/IMAP), WhatsApp ou Webchat.
2. O sistema cria o chamado com prefixo/protocolo único, calcula o tempo de SLA com base no calendário de trabalho e vincula o tenant correto.
3. O chamado é triado e atribuído automaticamente por regras de Workflow ou selecionado no painel Watchtower.
4. O analista atende o ticket visualizando o aviso de presença de outros colegas, acessa a Base de Conhecimento com suporte de busca vetorial IA e vincula os ativos do CMDB.
5. Caso necessite de uma alteração de infraestrutura, o analista abre uma Requisição de Mudança vinculada ao Ticket, que segue para votação do CAB.
6. Ao encerrar o chamado, a pesquisa de satisfação (CSAT) é disparada e as métricas alimentam o painel de relatórios.
```

---

## 5. Escopo do MVP (Escopo Atual Reconstituído)

### 5.1. Itens no Escopo (21 Módulos Implementados no Código)

#### 5.1.1. Gestão de Chamados & Central de Atenção
- **Watchtower:** Centralizador de pendências e itens que requerem ação do analista em tempo real.
- **Tickets (Chamados):** Interface estilo caixa de entrada, suporte a canais (E-mail M365/Gmail/IMAP, WhatsApp, Webchat), fusão (merge) e divisão (split) de chamados, adiamento (snooze), cálculo de SLA com fusos e calendários de trabalho, controle de colisão de analistas, respostas prontas e sanitização de HTML.
- **Self-Service Portal:** Catálogo de solicitações, artigos públicos da base de conhecimento, acompanhamento de tickets e recurso de gravação de tela.

#### 5.1.2. Gestão de Ativos, CMDB & Infraestrutura
- **Assets (Ativos):** Cadastro completo de hardware/software, custódia, garantias, etiquetas com QR Code e leitor de câmera integrado no web app, sincronização com VMware vCenter e Microsoft Intune.
- **CMDB:** Registro de itens de configuração (CIs) tipados com mapeamento de relacionamentos, análise de impacto e resumos sintetizados por IA.
- **Network Mapper:** Diagramação visual da topologia de rede vinculando nós diretamente aos objetos reais do CMDB.
- **Software Management:** Inventário de software corporativo via agente de coleta, controle de licenças e alocações.

#### 5.1.3. Conhecimento, Processos & Treinamento
- **Knowledge Base:** Leitura/escrita de artigos formatados em texto rico, controle de visibilidade por público-alvo (leitores, analistas, portais), chat com busca vetorial via IA e log de lacunas de conhecimento.
- **LMS (Treinamentos):** Criação e autoria de cursos (com auxílio de IA), suporte à importação de pacotes SCORM, atribuição de treinamentos a equipes e acompanhamento de progresso.
- **Process Mapper:** Construtor de diagramas de processo com raias (swimlanes), etapas personalizadas e exportação direta para código Mermaid.

#### 5.1.4. Governança ITIL, Mudanças & Problemas
- **Change Management:** Fluxo completo de Requisição de Mudança (RFC), votação de conselho de aprovação (CAB), matriz de avaliação de risco e revisão pós-implementação (PIR).
- **Problem Management:** Registro de problemas para incidentes recorrentes, cadastro de erros conhecidos e elaboração automatizada de relatórios de Causa Raiz (RCA) auxiliada por IA.
- **Service Status:** Painel público/interno de saúde dos serviços de TI alimentado por manutenção programada e incidentes ativos.

#### 5.1.5. Automações, Formulários, Contratos & Operações
- **Workflows:** Motor de regras visuais com +138 gatilhos, execução de ações entre módulos, chamadas de Webhooks e coautoria de regras via IA.
- **Forms Builder:** Construtor de formulários dinâmicos com suporte a IA para geração de campos e relatórios de submissões.
- **Contracts & RFP Builder:** Gestão de contratos e fornecedores com acompanhamento de renovações e gerador de documentos RFP com inteligência artificial (`rfp_ai.php`).
- **Morning Checks:** Checklists diários automatizados para verificação da saúde da infraestrutura, gráficos de tendência e exportação para PDF.
- **Tasks & Calendar:** Quadros Kanban, listas de tarefas, calendário corporativo da equipe com integração iCal.
- **System Administration & Security:** Gestão de analistas, equipes, departamentos, RBAC granular (`Cap::...`), autenticação MFA (TOTP), integração SSO (OIDC/LDAP), criptografia AES-256-GCM para segredos e ferramenta de verificação do esquema do banco de dados.

### 5.2. Itens Fora do Escopo (V2 ou Futuro / Sinais de Dívida e TODOs)
- **Refatoração para Enums nativos do PHP 8.1+:** O código mantém compatibilidade retroativa com PHP 7.4 via classes de constantes (`Cap::...`) e funções utilitárias *(evidenciado nos comentários de `includes/capabilities.php`)*.
- **Suporte a bancos de dados não-MySQL:** Toda a persistência é acoplada ao MySQL 8.0+ / MariaDB via PDO (`database/domus-desk.sql`).
- **Aplicativo móvel nativo (iOS/Android):** O acesso móvel é fornecido via Web App responsivo (PWA/Mobile-friendly) e extensão de navegador para Chrome/Edge.

---

## 6. Requisitos Funcionais

| ID | Requisito | Critério de Aceite | Evidência no Código |
|----|-----------|--------------------|---------------------|
| RF-001 | Autenticação Multi-Fator (MFA) | Dado um analista com MFA ativado, quando efetuar login com usuário/senha corretos, então deve ser solicitado o código TOTP de 6 dígitos antes de conceder a sessão. | `auth/login.php`, `includes/totp.php` |
| RF-002 | Gestão de Sessão e SSO | Dado um provedor OIDC ou LDAP configurado, quando um usuário optar pelo login corporativo, o sistema deve provisionar a conta via Just-in-Time (JIT) se ela não existir. | `includes/oidc.php`, `includes/ldap.php` |
| RF-003 | Cálculo e Notificação de SLA | Dado um chamado aberto, o sistema deve calcular a data/hora limite de resposta e resolução respeitando o calendário de trabalho do tenant e disparar alertas via cron antes da violação. | `includes/sla.php`, `cron/sla_breach_check.php` |
| RF-004 | Isolamento Multi-tenant | Dado um analista vinculado ao Tenant A, quando buscar ou visualizar recursos (tickets, ativos, mudanças), o sistema deve restringir os resultados estritamente aos registros pertencentes ao Tenant A. | `includes/tenancy.php`, `includes/tenancy-switcher.php` |
| RF-005 | Provedor de IA com BYOK | Dado um provedor de IA configurado (Anthropic, OpenAI ou OpenRouter), o sistema deve criptografar a chave API em repouso e permitir execuções de chat/geração de texto. | `includes/ai_provider.php`, `includes/encryption.php` |
| RF-006 | Votação e Aprovação de CAB | Dado um pedido de mudança de alto impacto, o sistema deve registrar a aprovação ou rejeição formal de cada membro do conselho CAB antes de permitir a transição para implementação. | `change-management/`, `database/domus-desk.sql` |
| RF-007 | Leitura de Etiquetas QR para Ativos | Dado o uso da câmera em um dispositivo móvel no módulo de ativos, o app web deve decodificar o QR Code e redirecionar para a ficha correspondente do ativo. | `includes/asset_labels.php`, `asset-management/` |
| RF-008 | Leitura e Ingestão de E-mails | Dado um servidor de e-mail (M365 via Graph API ou IMAP), a tarefa agendada deve importar novos e-mails convertendo-os em chamados ou respostas. | `includes/mailbox_graph.php`, `includes/mailbox_imap.php` |
| RF-009 | Coleta e Despacho de Webhooks | Dado um evento configurado no sistema (ex: abertura de ticket), o motor de webhooks deve assinar o payload com HMAC-SHA256 e despachar via requisição HTTP POST assíncrona. | `includes/webhook_delivery.php`, `cron/webhook_deliveries.php` |
| RF-010 | Controle Granular de Acesso (RBAC) | Dado um analista sem a capacidade referente a uma aba de configurações (ex: `Cap::ASSETS_VCENTER`), o sistema deve bloquear o acesso e retornar HTTP 403. | `includes/capabilities.php`, `includes/rbac.php` |

---

## 7. Requisitos Não-Funcionais

| Atributo | Requisito | Métrica / Mecanismo de Verificação | Evidência no Código |
|----------|-----------|-------------------------------------|---------------------|
| **Segurança** | Criptografia AES-256-GCM para segredos em repouso | Chaves armazenadas obrigatoriamente fora do web root em diretório com permissão `700`. | `config.php`, `includes/encryption.php`, `Dockerfile` |
| **Segurança** | Sanitização rigorosa de entradas e prevenção contra XSS | Todo conteúdo HTML vindo de e-mails ou formulários rico é sanitizado antes da exibição. | `includes/html_sanitise.php` |
| **Desempenho** | Tempo de resposta do motor de busca e paleta de comandos | Busca via teclado (Ctrl-K / ⌘K) em milissegundos com escopo por tenant e capacidade. | `index.php`, `includes/waffle-menu.php` |
| **Compatibilidade** | Suporte a múltiplas versões do ambiente de execução PHP | Execução limpa nas versões PHP 7.4, 8.0, 8.1, 8.2, 8.3 e 8.4 sem avisos ou erros de sintaxe. | `README.md`, `Dockerfile` |
| **Portabilidade** | Execução via containers de infraestrutura leve | Imagem Docker baseada em `php:8.4-apache` com MySQL 8.0 em suporte nativo a `docker compose`. | `Dockerfile`, `docker-compose.yml` |
| **Disponibilidade** | Execução assíncrona desacoplada via Cron | Tarefas críticas de SLA, Webhooks e Workflows agendados executados em background sem bloquear requisições web. | `cron/`, `docs/sla-cron-setup.md` |

---

## 8. Regras de Negócio

| ID | Regra | Descrição | Evidência no Código |
|----|-------|-----------|---------------------|
| RN-001 | Priorização e Severidade de SLA | A matriz de SLA deve considerar a combinação de Urgência x Impacto para determinar a prioridade do chamado. | `includes/sla.php` |
| RN-002 | Colisão de Atendimento | Se dois analistas abrirem a mesma ficha de chamado simultaneamente, o sistema deve alertar visualmente ambos sobre a presença do outro. | `includes/ticket_presence.php` |
| RN-003 | Fechamento e Pesquisa CSAT | Ao alterar o status de um chamado para "Resolvido", um e-mail com link para avaliação de satisfação (CSAT) deve ser gerado automaticamente. | `includes/csat.php` |
| RN-004 | Isolamento de Chave AES | O sistema impede o boot ou exibe aviso crítico se a chave de criptografia de segredos for mantida no diretório público do servidor web. | `config.php`, `includes/encryption.php` |
| RN-005 | Fallback de Autenticação Local | Em caso de falha de conexão com os servidores OIDC/LDAP corporativos, a conta administrativa local (`admin`) deve sempre ter permissão de autenticação direta como contingência. | `auth/login.php`, `README.md` |

---

## 9. Domínio e Dados

### 9.1. Glossário
| Termo | Definição |
|-------|-----------|
| **Analista** | Usuário técnico do sistema com permissões de atendimento e configuração definidas via RBAC. |
| **Solicitante (User)** | Usuário final da organização que abre e acompanha chamados. |
| **Tenant** | Empresa ou unidade de negócio cadastrada na plataforma para isolamento de dados (Multi-tenancy). |
| **SLA (Service Level Agreement)** | Acordo de nível de serviço com horários limites para primeira resposta e solução final. |
| **CAB (Change Advisory Board)** | Conselho consultivo de mudanças encarregado de votar e aprovar alterações de alto risco. |
| **CI (Configuration Item)** | Item de configuração cadastrado no CMDB (servidores, bancos de dados, aplicações). |
| **BYOK (Bring Your Own Key)** | Modelo onde o cliente insere sua própria chave API de IA (Anthropic/OpenAI/OpenRouter). |

### 9.2. Entidades Principais
- **`analysts`**: `analyst_id` (PK), `username`, `email`, `password_hash`, `is_admin`, `mfa_secret`, `tenant_id`.
- **`users`**: `user_id` (PK), `email`, `name`, `department_id`, `tenant_id`.
- **`tickets`**: `ticket_id` (PK), `ticket_number`, `title`, `description`, `status_id`, `priority_id`, `user_id`, `assigned_analyst_id`, `sla_due_date`, `tenant_id`.
- **`assets`**: `asset_id` (PK), `asset_tag`, `name`, `asset_type_id`, `status_id`, `custodian_user_id`, `tenant_id`.
- **`change_requests`**: `change_id` (PK), `title`, `risk_level`, `status`, `implementation_plan`, `rollback_plan`.
- **`problems`**: `problem_id` (PK), `title`, `known_error`, `root_cause_analysis`.
- **`cmdb_items`**: `item_id` (PK), `name`, `item_type_id`, `attributes_json`, `tenant_id`.
- **`target_mailboxes`**: `mailbox_id` (PK), `email_address`, `provider_type`, `encrypted_credentials`.
- **`workflow_rules`**: `rule_id` (PK), `trigger_event`, `conditions_json`, `actions_json`.

---

## 10. Métricas de Sucesso *(inferido a partir da estrutura dos relatórios e CSAT)*

### 10.1. Métricas de Negócio
- Redução do custo total de propriedade (TCO) com software de TI ao zerar taxas de licenciamento por usuário *(inferido a partir de `README.md`)*.
- Manutenção do índice de conformidade com LGPD/GDPR mantendo todos os dados em infraestrutura auto-hospedada.

### 10.2. Métricas de Produto
- Taxa de adoção do Portal de Autoatendimento versus abertura por e-mail desestruturado.
- Índice médio de satisfação dos usuários (CSAT > 4.5/5.0).
- Redução no tempo médio de primeira resposta (MTTA) e tempo médio de resolução (MTTR).

### 10.3. Métricas Operacionais
- Porcentagem de chamados atendidos rigorosamente dentro do prazo limite do SLA (> 95%).
- Taxa de falhas de entrega de Webhooks e e-mails zeradas via rotinas de retry agendadas.

---

## 11. Riscos e Dependências

### 11.1. Riscos
| Risco | Probabilidade | Impacto | Mitigação no Código |
|-------|---------------|--------|---------------------|
| Perda ou vazamento da chave de criptografia de segredos | Baixa | Alto | A chave é gerada em arquivo com permissão `700` fora da raiz do servidor web (`Dockerfile`, `entrypoint.sh`). |
| Desatualização do esquema do banco de dados durante atualizações | Média | Médio | Ferramenta interna de verificação do schema (`includes/db_verify_schema.php`) valida e reporta inconsistências. |
| Incompatibilidade ou esgotamento de quota na API de IA dos provedores | Média | Baixo | Falhas nas chamadas de IA lançam exceções tratadas (`ai_provider.php`), permitindo a operação normal do sistema sem IA. |

### 11.2. Dependências
- Servidor Web (Apache com `mod_rewrite` habilitado ou Nginx compatível).
- Banco de Dados MySQL 8.0+ ou MariaDB equivalente.
- PHP versão 7.4 até 8.4 com extensões `pdo`, `pdo_mysql`, `curl`, `json` e `openssl`.
- Tarefa agendada do sistema (Cron / Task Scheduler) configurada para invocar os scripts em `cron/`.

---

## 12. Cronograma Estimado (MVP / Histórico Reconstituído)

| Fase | Duração | Deliverables |
|------|---------|--------------|
| **Fase 1: Núcleo ITSM & Autenticação** | 4 Semanas | Esquema do banco de dados, motor de chamados, gestão de analistas/usuários e autenticação local/MFA. |
| **Fase 2: Ativos, CMDB & Governança ITIL** | 4 Semanas | Módulo de Ativos, leitor de QR Code, CMDB, Mapeador de Rede, Gestão de Mudanças (CAB) e Problemas (RCA). |
| **Fase 3: Automação, IA & Multi-tenancy** | 3 Semanas | Cliente reutilizável de IA (Anthropic/OpenAI/OpenRouter), motor visual de Workflows com +138 gatilhos e isolamento Multi-tenant. |
| **Fase 4: Integrações, API REST & Polimento** | 3 Semanas | Especificação OpenAPI v1, suporte a SSO OIDC/LDAP, integração vCenter/Intune, módulo LMS e internacionalização (21 idiomas). |
