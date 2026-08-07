# ADR-001: Arquitetura Monolítica Modular Web em PHP com Multi-tenancy, IA Multi-provider e RBAC Granular

**Data:** Julho/2026  
**Status:** Documentação reconstituída a partir do código-fonte existente em 30 de julho de 2026  
**Decisor:** Arquiteto de Software Principal (em conjunto com DBA e Engenheiro de Software)  
**Contexto:** Domus Desk — Plataforma de Gestão de Serviços de TI (ITSM) de código aberto, auto-hospedada, sem taxas de licenciamento por usuário e com 21 módulos integrados.

---

## 1. Questão ou Problema

Como projetar e estruturar uma plataforma de Gestão de Serviços de TI (ITSM) abrangente (englobando chamados, ativos, CMDB, governança ITIL, treinamentos e automação) que atenda aos seguintes requisitos de infraestrutura e operação:

1. **Facilidade Extrema de Implantação e Manutenção:** Permitir execução imediata em servidores web populares (Apache/LAMP/WAMP/Docker) sem a necessidade de build steps complexos, compiladores de frontend ou infraestruturas pesadas de microsserviços.
2. **Soberania de Dados e Criptografia em Repouso:** Manter segredos de integração (chaves de e-mail, tokens OAuth, chaves de IA) devidamente encriptados em repositório fora da raiz pública do servidor web.
3. **Escalabilidade Multi-tenant (MSP-ready):** Permitir que a mesma instância atenda múltiplos clientes ou subsidiárias garantindo rigoroso isolamento lógico de dados.
4. **Integração Plural com IA (BYOK):** Suportar modelos da Anthropic, OpenAI e OpenRouter sem acoplamento a um único fornecedor ou framework proprietário.
5. **Segurança Granular baseada em Capacidades (RBAC):** Garantir controle fino de acesso por abas de configuração e módulos, evitando privilégios excessivos.

---

## 2. Decisão

**Adotar uma arquitetura monolítica modular desenvolvida em PHP (suportando da versão 7.4 à 8.4) com persistência em MySQL 8.0+, interface em Vanilla JavaScript com suporte a temas/modo escuro, cliente de IA agnóstico multi-provedor (BYOK), isolamento de multi-tenancy nativo no banco e barramento de permissões RBAC orientado a constantes estáticas.**

### 2.1. Frontend
- **Interface e Estilização:** HTML5 semântico com Vanilla CSS (design moderno adaptável para desktop e dispositivos móveis, suporte nativo a temas e Dark Mode).
- **Lógica e Interatividade:** Vanilla JavaScript (sem frameworks como React, Vue ou Angular, eliminando etapas de transpilação e dependências de Node.js no servidor de produção).
- **Componentes de Terceiros:** TinyMCE para edição em texto rico (Knowledge e Chamados), biblioteca de leitores de QR Code para ativos via câmera, e Mermaid JS para renderização de fluxogramas.
- **Produtividade do Operador:** Paleta de comandos via teclado (⌘K / Ctrl-K) com busca global indexada e escopada por tenant e capacidades do analista.

### 2.2. Backend
- **Linguagem:** PHP (compatibilidade garantida da faixa 7.4 até 8.4).
- **Servidor Web:** Apache com `mod_rewrite` habilitado (via `.htaccess`) ou Nginx equivalente.
- **Padrão Arquitetural:** Monolito Modular divido em 21 diretórios de recursos (`tickets/`, `asset-management/`, `knowledge/`, `change-management/`, `problem-management/`, `cmdb/`, `lms/`, `workflow/`, etc.) utilizando componentes compartilhados localizados em `includes/`.
- **Persistência de Dados:** Banco de dados relacional MySQL 8.0+ / MariaDB acessado via PDO (PHP Data Objects) com consultas parametrizadas e rotinas de verificação automática de integridade do esquema (`db_verify_schema.php`).
- **Segurança de Segredos:** Criptografia simétrica AES-256-GCM via OpenSSL (`includes/encryption.php`) com chaves mantidas em arquivos protegidos fora do web root.
- **API pública:** API REST v1 (`api/v1/`) com autenticação baseada em chaves, controle de escopo e especificação viva OpenAPI 3.0.

---

## 3. Justificativa

### 3.1. Por que PHP 7.4–8.4 com Apache/mod_rewrite e Vanilla JavaScript?
**Vantagens:**
- **Compatibilidade Universal:** Funciona em praticamente qualquer ambiente de hospedagem web (servidores dedicados Linux, WAMP/XAMPP no Windows ou containers Docker).
- **Sem Necessidade de Build:** Mudanças no código ou templates surtem efeito imediato sem necessidade de `npm run build`, Webpack ou Vite no ambiente final.
- **Baixo Consumo de Recursos:** Excelente footprint de memória em comparação com stacks baseadas em Node.js/Java/Python para aplicações administrativas.

**Trade-off:**
- Ausência de tipos nativos estritos em algumas partes legadas do PHP 7.4 e maior disciplina requerida para manutenção da organização do código.

### 3.2. Por que Arquitetura Monolítica Modular com MySQL 8.0+?
**Vantagens:**
- **Simplicidade de Implantação e Backup:** Toda a aplicação e suas tabelas residem em uma única base MySQL e uma única árvore de arquivos, simplificando procedimentos de rotina de TI.
- **Integridade Referencial Completa:** Relacionamentos diretos entre Tickets, Ativos, Itens do CMDB, Mudanças, Problemas e Usuários garantidos via chaves estrangeiras (Foreign Keys).

**Trade-off:**
- Escalonamento horizontal requer replicação de banco de dados MySQL e compartilhamento de volumes de anexos (`/tickets/attachments`).

### 3.3. Por que Criptografia AES-256-GCM em Repouso fora do Web Root?
**Vantagens:**
- **Proteção contra Leitura Indireta:** Caso ocorra uma falha de configuração no servidor web que exponha arquivos PHP, os segredos (credenciais IMAP/M365, tokens OIDC, chaves de IA) permanecem indecifráveis sem a chave que reside em `/var/www/encryption_keys/`.

---

## 4. Consequências

### 4.1. Positivas
- ✅ **Custo Zero de Licenciamento:** Todo o sistema e seus módulos são entregues sob a licença MIT sem limitação por número de agentes.
- ✅ **Facilidade de Auditoria:** O código PHP procedural e orientado a funções utilitárias facilita a inspeção e manutenção por equipes internas de TI.
- ✅ **Resiliência de Integração de IA:** O cliente `ai_provider.php` abstrai as APIs da Anthropic, OpenAI e OpenRouter com retentativas automatizadas e fallback elegante em caso de indisponibilidade da API.
- ✅ **Multi-tenancy Nativo:** Tabela `tenants` e funções de escopo em `includes/tenancy.php` garantem o isolamento rigoroso de empresas/clientes corporativos.

### 4.2. Negativas
- ❌ **Acoplamento ao MySQL:** Dependência de sintaxe e tipos específicos do MySQL/MariaDB, dificultando a migração para PostgreSQL ou bancos NoSQL sem refatoração das consultas SQL em `database/domus-desk.sql`.
- ❌ **Retrocompatibilidade de Sintaxe:** O suporte mantido ao PHP 7.4 impede o uso imediato de Enums nativos do PHP 8.1, exigindo a simulação via classes de constantes estáticas (`Cap::...`).

### 4.3. Mitigações
| Risco / Limitação | Mitigação no Código |
|-------------------|---------------------|
| Inconsistência no esquema MySQL durante atualizações | Execução da ferramenta de checagem do banco (`includes/db_verify_schema.php`) que compara a estrutura ativa com as especificações do sistema. |
| Erros de digitação em nomes de permissões RBAC | Uso obrigatório de constantes de classe (`Cap::ASSETS_VCENTER`) em vez de strings soltas, gerando erros fatais imediatos em desenvolvimento caso uma constante inexistente seja chamada. |

---

## 5. Arquitetura Técnica Detalhada

### 5.1. Diagrama de Componentes (C4 Model - Nível 2)

```text
+-----------------------------------------------------------------------------------+
|                                  DOMUS DESK                                       |
|                                                                                   |
|  +-----------------------------------------------------------------------------+  |
|  |                         CAMADA DE INTERFACE (UI)                            |  |
|  |   [Painel Web / Watchtower] [Portal Autoatendimento] [Extensão Navegador]   |  |
|  +-----------------------------------------------------------------------------+  |
|                                         |                                         |
|                                         v                                         |
|  +-----------------------------------------------------------------------------+  |
|  |                       CAMADA DE ROTEAMENTO E RBAC                           |  |
|  |     index.php / .htaccess  --->  includes/rbac.php & capabilities.php       |  |
|  +-----------------------------------------------------------------------------+  |
|                                         |                                         |
|       +---------------------------------+---------------------------------+       |
|       |                                 |                                 |       |
|       v                                 v                                 v       |
|  +------------------+         +-------------------+         +------------------+  |
|  | MÓDULOS CORE     |         | GOVERNANÇA & ITIL |         | AUTOMATION & AI  |  |
|  | - tickets/       |         | - change-mgmt/    |         | - workflow/      |  |
|  | - asset-mgmt/    |         | - problem-mgmt/   |         | - ai_provider.php|  |
|  | - knowledge/     |         | - cmdb/           |         | - forms/         |  |
|  | - tasks/         |         | - software/       |         | - rfp_ai.php     |  |
|  +------------------+         +-------------------+         +------------------+  |
|       |                                 |                                 |       |
|       +---------------------------------+---------------------------------+       |
|                                         |                                         |
|                                         v                                         |
|  +-----------------------------------------------------------------------------+  |
|  |                      CAMADA DE SERVIÇOS E SEGURANÇA                         |  |
|  |    includes/tenancy.php | encryption.php | html_sanitise.php | sla.php      |  |
|  +-----------------------------------------------------------------------------+  |
|                                         |                                         |
|                                         v                                         |
|  +-----------------------------------------------------------------------------+  |
|  |                        PERSISTÊNCIA & ARMAZENAMENTO                         |  |
|  |      MySQL 8.0+ (PDO)  <--->  Chaves AES (/var/www/encryption_keys/)        |  |
|  +-----------------------------------------------------------------------------+  |
+-----------------------------------------------------------------------------------+
```

### 5.2. Fluxo Principal (Atendimento de Chamado com SLA e IA)

```text
[Solicitante / E-mail / Webchat]
             |
             v
[Ingestão: mailbox_graph.php / tickets/new.php]
             |
             v (Calcula SLA via includes/sla.php & Vincula Tenant via tenancy.php)
             |
[Gera Registro na Tabela `tickets`]
             |
             v (Motor de regras: includes/workflow_scheduled.php)
[Executa Ação de Automação / Atribuição a Equipe]
             |
             v (Analista abre ticket na UI: detecção de presenças em ticket_presence.php)
[Analista solicita sugestão de resposta via IA]
             |
             v (Invocação de includes/ai_provider.php com chave decifrada por encryption.php)
[Provedor IA (Anthropic / OpenAI / OpenRouter)] ---> [Retorna Texto Rascunhado]
             |
             v (Analista envia resposta)
[Envio por E-mail/WhatsApp + Registro no Audit Log + Disparo de CSAT na resolução]
```

### 5.3. Estrutura de Pastas

```text
domus-desk/
├── api/                   # Endpoints REST públicos e internos (v1 com OpenAPI spec)
├── asset-management/      # Módulo de Gestão de Ativos e Garantias
├── auth/                  # Lógica de Autenticação (Login, MFA, SSO, Logout)
├── calendar/              # Calendário corporativo da equipe
├── change-management/     # Módulo ITIL de Gestão de Mudanças e aprovação CAB
├── cmdb/                  # Base de Dados de Gerenciamento de Configuração
├── config.php             # Arquivo principal de configuração e inicialização
├── contracts/             # Módulo de Contratos de Fornecedores e Construtor RFP
├── cron/                  # Tarefas agendadas (SLA breach check, webhooks, workflows)
├── database/              # Esquema SQL (domus-desk.sql) e scripts de dados demo
├── docker/                # Configurações de containerização Docker e scripts de entrada
├── docs/                  # Documentações técnicas e diagramas
├── forms/                 # Construtor de Formulários Dinâmicos
├── includes/              # Componentes compartilhados (RBAC, Criptografia, IA, Tenancy, SLA)
├── knowledge/             # Base de Conhecimento com busca vetorial por IA
├── lms/                   # Módulo de Gestão de Aprendizagem e SCORM
├── morning-checks/        # Checagens diárias da infraestrutura
├── network-mapper/        # Diagramação visual de topologia de rede
├── problem-management/    # Gestão de Problemas e análise de causa raiz (RCA)
├── process-mapper/        # Construtor de Fluxogramas de Processos (Mermaid)
├── reporting/             # Relatórios, Trilhas de Auditoria e relatórios Intune
├── software/              # Inventário e Licenciamento de Software
├── system/                # Administração do Sistema, Analistas, Papéis e Verificação de BD
├── tasks/                 # Gestão de Tarefas (Kanban / Lista / Timeline)
├── tickets/               # Módulo Principal de Chamados (Inbox, Snooze, Merge, Split)
└── watchtower/            # Painel Central de Atenção em Tempo Real
```

---

## 6. Plano de Implementação em Fases (Recomendações Prospectivas)

### Fase 1: Atualização do Floor da Linguagem e Adopção de Enums
- **Ação:** Elevar o requisito mínimo do servidor para PHP 8.1+ e converter a classe de constantes `Cap` em Enum nativo (`BackedEnum`), simplificando a verificação de propriedades e removendo a necessidade de funções auxiliares legadas *(recomendação prospectiva baseada nos comentários em `includes/capabilities.php`)*.

### Fase 2: Modularização de Assets estáticos e Bundling opcional
- **Ação:** Introduzir uma etapa opcional de empacotamento de assets CSS/JS para ambientes de alta carga, reduzindo a quantidade de requisições HTTP individuais sem quebrar o fluxo sem build em desenvolvimento.

### Fase 3: Ampliação de Cobertura de Testes Automatizados
- **Ação:** Expandir a suíte de testes em `tests/` para cobrir módulos de governança (Mudanças e Problemas) além dos testes de visibilidade da base de conhecimento já existentes.

---

## 7. Métricas de Sucesso para esta Arquitetura

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **Tempo de Boot/Carregamento da UI** | < 300ms | Inspeção de tempo de renderização no console do navegador e cabeçalhos de resposta HTTP. |
| **Integridade de Criptografia de Segredos** | 100% dos segredos encriptados | Verificação da função `encryptSecret()` antes da gravação de credenciais no banco. |
| **Isolamento de Dados Multi-tenant** | 0 vazamentos entre tenants | Suíte de testes em `tests/` validando consultas com filtro de `tenant_id`. |
| **Conformidade do Esquema MySQL** | 100% de correspondência | Execução com sucesso da ferramenta `includes/db_verify_schema.php`. |

---

## 8. Alternativas Consideradas e Rejeitadas (Análise Prospectiva)

### 8.1. Arquitetura de Microsserviços (ex: Node.js / Go)
**Rejeitado porque:**
- Aumentaria drasticamente a complexidade de implantação para equipes pequenas de TI que necessitam de um sistema auto-hospedado simples.
- Exigiria orquestradores como Kubernetes ou múltiplos containers para rodar uma solução que funciona perfeitamente em um único ambiente monolítico.

### 8.2. Frameworks SPA Pesados no Frontend (React / Angular)
**Rejeitado porque:**
- Criaria dependência obrigatória de ambiente Node.js e ferramentas de compilação durante o desenvolvimento e atualização.
- Impossibilitaria a edição e customização direta de scripts no servidor pelo administrador do sistema.

---

## 9. Próximos Passos

1. Manter a execução rotineira da verificação do banco de dados (`includes/db_verify_schema.php`) durante atualizações de versão.
2. Garantir que todas as novas abas ou recursos administrativos adicionados no sistema registrem sua constante equivalente na classe `Cap` (`includes/capabilities.php`).
3. Continuar a expansão dos conectores de IA em `includes/ai_provider.php` para suporte a novos modelos conforme lançados no mercado.

---

## 10. Referências

- [README.md](file:///home/mmc/00_code/domus-desk/README.md) — Documentação Geral e Módulos do Domus Desk.
- [config.php](file:///home/mmc/00_code/domus-desk/config.php) — Configurações Globais e Tratamento de Criptografia/Timezones.
- [includes/capabilities.php](file:///home/mmc/00_code/domus-desk/includes/capabilities.php) — Matriz de Permissões e Capacidades RBAC.
- [includes/ai_provider.php](file:///home/mmc/00_code/domus-desk/includes/ai_provider.php) — Cliente de Integração com Provedores de IA.

---

## 11. Rastreabilidade

A tabela a seguir relaciona as principais afirmações, requisitos e decisões arquiteturais presentes no PRD e neste ADR com os arquivos do código-fonte do repositório que as comprovam:

| Afirmação / Decisão | Evidência no Código-Fonte |
|---------------------|---------------------------|
| Suporte à faixa PHP 7.4–8.4 com Apache | [README.md](file:///home/mmc/00_code/domus-desk/README.md#L11), [Dockerfile](file:///home/mmc/00_code/domus-desk/Dockerfile#L1) |
| Criptografia AES-256-GCM para segredos em repouso fora da raiz web | [config.php](file:///home/mmc/00_code/domus-desk/config.php#L14-L21), [includes/encryption.php](file:///home/mmc/00_code/domus-desk/includes/encryption.php) |
| Cliente de IA agnóstico multi-provider (Anthropic, OpenAI, OpenRouter) | [includes/ai_provider.php](file:///home/mmc/00_code/domus-desk/includes/ai_provider.php#L11-L27) |
| Sistema RBAC de Layer 2 com constantes tipadas para evitar falhas silenciosas | [includes/capabilities.php](file:///home/mmc/00_code/domus-desk/includes/capabilities.php#L10-L46), [includes/rbac.php](file:///home/mmc/00_code/domus-desk/includes/rbac.php) |
| Multi-tenancy nativo no banco com isolamento por empresa/tenant | [includes/tenancy.php](file:///home/mmc/00_code/domus-desk/includes/tenancy.php), [database/domus-desk.sql](file:///home/mmc/00_code/domus-desk/database/domus-desk.sql#L741) |
| Especificação e documentação OpenAPI v1 REST pública | [api/v1/index.php](file:///home/mmc/00_code/domus-desk/api/v1/index.php), [api/v1/spec.json](file:///home/mmc/00_code/domus-desk/api/v1/spec.json) |
| Motor de Workflows com suporte a Webhooks assinados com HMAC-SHA256 | [includes/webhook_delivery.php](file:///home/mmc/00_code/domus-desk/includes/webhook_delivery.php), [cron/webhook_deliveries.php](file:///home/mmc/00_code/domus-desk/cron/webhook_deliveries.php) |
| Gestão e Cálculo de SLA com suporte a múltiplos calendários de trabalho | [includes/sla.php](file:///home/mmc/00_code/domus-desk/includes/sla.php), [cron/sla_breach_check.php](file:///home/mmc/00_code/domus-desk/cron/sla_breach_check.php) |
| Sanitização rigorosa de entradas de texto rico contra XSS | [includes/html_sanitise.php](file:///home/mmc/00_code/domus-desk/includes/html_sanitise.php) |
| Verificação de esquema e validação de integridade da estrutura do banco de dados | [includes/db_verify_schema.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_schema.php) |
