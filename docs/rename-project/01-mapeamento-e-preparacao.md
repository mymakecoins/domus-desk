# Etapa 01: Mapeamento de Escopo, Análise de Impacto e Preparação de Ambiente

## 1. Visão Geral
Esta etapa aborda o planejamento inicial, o inventário completo das ocorrências da nomenclatura antiga (`freeitsm`) e a definição do ecossistema de backup e controle de versão necessários antes de realizar qualquer alteração estrutural no repositório **domus-desk**.

---

## 2. Dicionário de De/Para (Transformação de Identificadores)

Para garantir consistência semântica e funcional, as substituições devem seguir estritamente o padrão abaixo:

| Contexto / Formato | Nome Antigo | Novo Nome (`domus-desk`) | Exemplo / Aplicação |
| :--- | :--- | :--- | :--- |
| **Identificador CLI / Slug** | `freeitsm` | `domus-desk` | URLs, repositórios, pastas de projeto, Docker stack |
| **Padrão PascalCase** | `FreeITSM` | `DomusDesk` | Nomes de classes (`DomusDeskProvider`), namespaces |
| **Padrão UPPERCASE** | `FREEITSM` | `DOMUS_DESK` | Constantes de banco, entradas de CMDB |
| **Padrão snake_case** | `free_itsm` | `domus_desk` | Nomes de banco de dados, nomes de variáveis de configuração |
| **Padrão de Nome Exibido** | `FreeITSM` | `Domus Desk` | Títulos na interface de usuário (UI), logs, extensões |
| **Arquivo de Chave de Criptografia** | `freeitsm.key` | `domus_desk.key` | `/var/www/encryption_keys/domus_desk.key` |
| **Arquivo de Schema SQL** | `freeitsm.sql` | `domus-desk.sql` | `database/domus-desk.sql` |
| **Header HTTP de Assinatura** | `HTTP_X_FREEITSM_SIGNATURE` | `HTTP_X_DOMUS_DESK_SIGNATURE` | Webhooks / Cron integration |

---

## 3. Matriz de Mapeamento de Arquivos e Componentes Impactados

Com base na varredura profunda realizada na base de código, foram mapeados os seguintes arquivos por categoria:

### 3.1. Arquivos de Configuração e Orquestração
- [config.php](file:///home/mmc/00_code/domus-desk/config.php): `ENCRYPTION_KEY_PATH`, comentários de `BASE_URL` (`/freeitsm-app/` -> `/domus-desk/`).
- [db_config.sample.php](file:///home/mmc/00_code/domus-desk/db_config.sample.php): `define('DB_NAME', 'freeitsm');` -> `define('DB_NAME', 'domus_desk');`.
- [docker-compose.yml](file:///home/mmc/00_code/domus-desk/docker-compose.yml): nomes de variáveis (`DB_NAME`, `DB_USERNAME`, `DB_PASSWORD`), caminhos de volumes e arquivo de schema.
- [Dockerfile](file:///home/mmc/00_code/domus-desk/Dockerfile) & [docker/entrypoint.sh](file:///home/mmc/00_code/domus-desk/docker/entrypoint.sh): caminho da chave de criptografia `/var/www/encryption_keys/freeitsm.key`.
- [run.sh](file:///home/mmc/00_code/domus-desk/run.sh): Script de automação e gerenciamento da stack Docker.
- [.htaccess](file:///home/mmc/00_code/domus-desk/.htaccess): Comentários e regras de Rewrite contendo URLs legadas (`freeitsm-app`).

### 3.2. Banco de Dados e Schemas
- [database/freeitsm.sql](file:///home/mmc/00_code/domus-desk/database/freeitsm.sql): Renomear arquivo para `database/domus-desk.sql` e atualizar cabeçalhos, comentários e senha/usuário padrão.
- **Arquivos de Demo Data**:
  - `database/demo-data/cmdb.json`
  - `database/demo-data/lms.json`
  - `database/demo-data/network-mapper.json`
- **Scripts de Verificação de Schema**:
  - [scripts/gen_db_verify_indexes.php](file:///home/mmc/00_code/domus-desk/scripts/gen_db_verify_indexes.php)
  - [includes/db_verify_schema.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_schema.php)
  - [includes/db_verify_indexes.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_indexes.php)
  - [includes/db_verify_column_parse.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_column_parse.php)
  - [includes/db_verify_index_parse.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_index_parse.php)
  - [api/system/db_verify.php](file:///home/mmc/00_code/domus-desk/api/system/db_verify.php)

### 3.3. Core Backend e Provedores
- **Provedor de Webchat**:
  - [includes/messaging/FreeitsmProvider.php](file:///home/mmc/00_code/domus-desk/includes/messaging/FreeitsmProvider.php) -> Renomear para `DomusDeskProvider.php`.
  - [includes/messaging/messaging.php](file:///home/mmc/00_code/domus-desk/includes/messaging/messaging.php): Atualizar fábrica para instanciar `DomusDeskProvider`.
- **Criptografia e AI**:
  - [includes/encryption.php](file:///home/mmc/00_code/domus-desk/includes/encryption.php): Fallback do caminho da chave `.key`.
  - [includes/ai_provider.php](file:///home/mmc/00_code/domus-desk/includes/ai_provider.php): Cabeçalhos `X-Title` e `HTTP-Referer`.

### 3.4. Interfaces de Usuário, i18n e Componentes Externos
- **Internacionalização (`lang/`)**: Mais de 20 arquivos em `lang/*/` contendo strings de UI.
- **Extensão de Navegador (`browser-extension/`)**: `manifest.json`, `background.js`, `options.html`, `options.js`, `popup.js`.
- **Scripts Auxiliares**: `scripts/Invoke-AssetInventory.ps1`.
- **Documentação e Metadados**: `README.md`, `LICENSE`, `docs/*.md`, `system/help/*.php`.

---

## 4. Estratégia de Backup e Mitigação de Riscos

Antes de iniciar qualquer alteração nos arquivos:

1. **Controle de Versão (Git)**:
   - Garantir que a árvore Git esteja limpa.
   - Criar uma branch dedicada para a renomeação:
     ```bash
     git checkout -b feature/rename-project-to-domus-desk
     ```

2. **Backup de Estado / Banco de Dados**:
   - Caso haja instâncias MySQL ativas com dados:
     ```bash
     docker exec freeitsm-db-1 mysqldump -u root -prootpassword freeitsm > backup_freeitsm_pre_rename.sql
     ```

3. **Backup de Chaves de Criptografia**:
   - Preservar qualquer arquivo `.key` existente em `/var/www/encryption_keys/` ou `C:\wamp64\encryption_keys\`.

---

## 5. Próximos Passos
Prosseguir para a **[Etapa 02: Infraestrutura, Docker e Scripts de Deploy](file:///home/mmc/00_code/domus-desk/docs/rename-project/02-infraestrutura-docker-scripts.md)** para realizar os ajustes na camada de orquestração e ambiente.
