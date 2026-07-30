# Etapa 02: Infraestrutura, Docker e Scripts de Deploy

## 1. Visão Geral
Esta etapa especifica as alterações necessárias nos arquivos de orquestração do Docker, nos scripts de automação CLI e nos arquivos de configuração do servidor web para atualizar a infraestrutura de **freeitsm** para **domus-desk**.

---

## 2. Alterações no Docker Compose (`docker-compose.yml`)

O arquivo [docker-compose.yml](file:///home/mmc/00_code/domus-desk/docker-compose.yml) define os serviços `app` e `db`, portas, variáveis de ambiente e volumes.

### Mudanças Específicas:
1. **Variáveis de Ambiente do serviço `app`**:
   - `DB_NAME=freeitsm` -> `DB_NAME=domus_desk`
   - `DB_USERNAME=freeitsm` -> `DB_USERNAME=domus_desk`
   - `DB_PASSWORD=freeitsm` -> `DB_PASSWORD=domus_desk` (ou manter credencial segura padrão)
   - `ENCRYPTION_KEY_PATH=/var/www/encryption_keys/freeitsm.key` -> `ENCRYPTION_KEY_PATH=/var/www/encryption_keys/domus_desk.key`
2. **Variáveis de Ambiente do serviço `db`**:
   - `MYSQL_DATABASE: freeitsm` -> `MYSQL_DATABASE: domus_desk`
   - `MYSQL_USER: freeitsm` -> `MYSQL_USER: domus_desk`
   - `MYSQL_PASSWORD: freeitsm` -> `MYSQL_PASSWORD: domus_desk`
3. **Mapeamento de Volume de Inicialização SQL**:
   - `- ./database/freeitsm.sql:/docker-entrypoint-initdb.d/01-schema.sql` -> `- ./database/domus-desk.sql:/docker-entrypoint-initdb.d/01-schema.sql`

---

## 3. Alterações no Dockerfile e Entrypoint

### 3.1. [Dockerfile](file:///home/mmc/00_code/domus-desk/Dockerfile)
- Verificar se existem diretórios ou comentários fazendo referência explícita a `freeitsm`.
- Atualizar permissões e criação de pastas de chave para `/var/www/encryption_keys/`.

### 3.2. [docker/entrypoint.sh](file:///home/mmc/00_code/domus-desk/docker/entrypoint.sh)
- Alterar o fallback da variável `ENCRYPTION_KEY_PATH`:
  - De: `KEY_PATH="${ENCRYPTION_KEY_PATH:-/var/www/encryption_keys/freeitsm.key}"`
  - Para: `KEY_PATH="${ENCRYPTION_KEY_PATH:-/var/www/encryption_keys/domus_desk.key}"`
- Atualizar comentários de cabeçalho: `Domus Desk Docker Entrypoint`.

### 3.3. [docker/config.php](file:///home/mmc/00_code/domus-desk/docker/config.php) e [docker/db_config.php](file:///home/mmc/00_code/domus-desk/docker/db_config.php)
- Atualizar os comentários e fallbacks das variáveis de ambiente `DB_NAME` (`domus_desk`), `DB_USERNAME` (`domus_desk`) e `DB_PASSWORD`.

---

## 4. Alterações no Script Principal de Gerenciamento (`run.sh`)

O arquivo [run.sh](file:///home/mmc/00_code/domus-desk/run.sh) é o utilitário em Bash para compilar, iniciar, parar e verificar os containers Docker da aplicação.

### Mudanças Específicas:
1. **Banner e Títulos de Log**:
   - "FreeITSM - Script de Inicialização e Gestão em Containers" -> "Domus Desk - Script de Inicialização e Gestão em Containers"
   - Banner visual: `Domus Desk - Docker Stack`
2. **Filtros e Limpeza de Containers**:
   - Na função `stop_containers()`:
     - `FREEITSM_CONTAINERS=$(docker ps -a -q --filter "name=freeitsm" ...)` -> `DOMUS_DESK_CONTAINERS=$(docker ps -a -q --filter "name=domus-desk" ...)`
3. **Validação de Arquivos Obrigatórios em `start_stack()`**:
   - `"database/freeitsm.sql"` -> `"database/domus-desk.sql"`
4. **Verificação de Healthcheck do Container de Banco**:
   - `DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' freeitsm-db-1 ...)` -> `DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' domus-desk-db-1 ...)`
5. **Mensagens de Sucesso e Credenciais Exibidas**:
   - Usuário/Senha DB exibidos nos logs de inicialização: `domus_desk`.
   - Mensagens de rodapé: "Domus Desk inicializado com sucesso em containers!".

---

## 5. Ajustes em Arquivos de Configuração Web

### 5.1. [config.php](file:///home/mmc/00_code/domus-desk/config.php)
- Comentários na linha 17:
  - De: `/var/www/encryption_keys/freeitsm.key`
  - Para: `/var/www/encryption_keys/domus_desk.key`
- Comentários no bloco `BASE_URL` (linha 54):
  - Exemplo de subpasta: `http://localhost/domus-desk-app/` -> `BASE_URL = '/domus-desk-app/'`

### 5.2. [db_config.sample.php](file:///home/mmc/00_code/domus-desk/db_config.sample.php)
- Linha 13: `define('DB_NAME', 'domus_desk');`

### 5.3. [.htaccess](file:///home/mmc/00_code/domus-desk/.htaccess)
- Comentários de cabeçalho e exemplos de RewriteCond:
  - `# FreeITSM root URL routing` -> `# Domus Desk root URL routing`
  - `%1 captures the URL base ("/domus-desk-app/" locally ...)`

---

## 6. Checklist de Execução da Etapa 02
- [ ] Atualizar `docker-compose.yml`.
- [ ] Atualizar `Dockerfile` e arquivos da pasta `docker/`.
- [ ] Renomear referências em `run.sh`.
- [ ] Atualizar `config.php`, `db_config.sample.php` e `.htaccess`.
- [ ] Testar a sintaxe do arquivo compose: `docker compose config`.

---

## 7. Próximos Passos
Prosseguir para a **[Etapa 03: Banco de Dados e Scripts de Verificação de Schema](file:///home/mmc/00_code/domus-desk/docs/rename-project/03-banco-de-dados-e-schema.md)**.
