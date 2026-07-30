# Resumo Executivo: Etapa 02 — Infraestrutura, Docker e Scripts de Deploy

> **Status:** Concluída  
> **Data:** 29/07/2026  
> **Branch de Execução:** `feature/rename-project-to-domus-desk`  
> **Escopo:** Refatoração da infraestrutura de containerização, scripts de automação CLI (`run.sh`), arquivos de configuração PHP do ambiente Docker e servidor web (`.htaccess`).

---

## 1. Visão Geral da Etapa 02

A **Etapa 02** tratou da atualização completa da camada de infraestrutura e orquestração do projeto. Todas as referências à nomenclatura antiga nas definições de serviços Docker, nomes de variáveis de banco, caminhos de chaves de criptografia e utilitários de gestão de ambiente foram migradas para **`domus-desk`** e **`domus_desk`**.

---

## 2. Alterações Realizadas por Componente

### 2.1. Containerização & Docker Compose (`docker-compose.yml`)
- **Serviço `app`**:
  - `DB_NAME` e `DB_USERNAME`: atualizados de `freeitsm` para `domus_desk`.
  - `ENCRYPTION_KEY_PATH`: atualizado para `/var/www/encryption_keys/domus_desk.key`.
- **Serviço `db`**:
  - `MYSQL_DATABASE`, `MYSQL_USER` e `MYSQL_PASSWORD`: atualizados de `freeitsm` para `domus_desk`.
  - Mapeamento de inicialização SQL: redefinido para `./database/domus-desk.sql:/docker-entrypoint-initdb.d/01-schema.sql`.

### 2.2. Arquivos de Imagem Docker & Entrypoint (`docker/`)
- **`Dockerfile`**: Verificado e validado (sem referências legadas quebrando build).
- **`docker/entrypoint.sh`**:
  - Fallback de chave atualizado para `KEY_PATH="${ENCRYPTION_KEY_PATH:-/var/www/encryption_keys/domus_desk.key}"`.
  - Cabeçalho de log atualizado para `Domus Desk Docker Entrypoint`.
- **`docker/config.php` & `docker/db_config.php`**:
  - Fallbacks de `DB_NAME`, `DB_USERNAME` e `DB_PASSWORD` ajustados para `domus_desk`.
  - Comentários e documentação interna atualizados para `Domus Desk`.

### 2.3. Script CLI de Gestão da Stack (`run.sh`)
- Banner visual e logs do script atualizados para `Domus Desk - Docker Stack`.
- Filtros de remoção de containers (`stop_containers()`) ajustados para buscar `name=domus-desk` (`DOMUS_DESK_CONTAINERS`).
- Validação de pré-requisitos (`start_stack()`) direcionada para verificar `database/domus-desk.sql`.
- Healthcheck ajustado para verificar `domus-desk-db-1` / `domus_desk_db_1`.
- Credenciais e mensagens de boas-vindas pós-inicialização atualizadas para refletir o usuário/banco `domus_desk`.

### 2.4. Configurações Globais PHP e Servidor Web
- **`config.php`**: Exemplo e comentários de `ENCRYPTION_KEY_PATH` e `BASE_URL` atualizados para `/var/www/encryption_keys/domus_desk.key` e `/domus-desk-app/`.
- **`db_config.sample.php`**: Exemplo de conexão atualizado para `define('DB_NAME', 'domus_desk');`.
- **`.htaccess`**: Comentários de cabeçalho e exemplos de RewriteCond atualizados para `Domus Desk` e `/domus-desk-app/`.

---

## 3. Validação Executada

A sintaxe do arquivo de composição foi validada através do Docker CLI:
```bash
docker compose config
```
**Resultado:**  
- Nome da stack: `domus-desk`
- Todos os serviços, variáveis de ambiente, portas e mapeamentos de volume bind/named resolveram com **sucesso (código de saída 0)** sem avisos de depreciação ou erros de sintaxe.

---

## 4. Conclusão e Próxima Etapa

A **Etapa 02 foi concluída com sucesso**. Toda a camada de infraestrutura e gerenciamento local está devidamente padronizada para **`domus-desk`**.

### ➡️ Próximo Passo:
Prosseguir imediatamente para a **Etapa 03**:  
📄 [`docs/rename-project/03-banco-de-dados-e-schema.md`](file:///home/mmc/00_code/domus-desk/docs/rename-project/03-banco-de-dados-e-schema.md)  
*Escopo: Renomeação física de `database/freeitsm.sql` para `database/domus-desk.sql`, atualização dos arquivos de dados de demonstração (`cmdb.json`, `lms.json`, `network-mapper.json`) e refatoração do motor de verificação de schema (`includes/db_verify_*.php` e `scripts/gen_db_verify_indexes.php`).*
