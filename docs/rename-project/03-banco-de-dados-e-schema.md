# Etapa 03: Banco de Dados e Scripts de Verificação de Schema

## 1. Visão Geral
Esta etapa descreve a renomeação do script SQL principal, a atualização dos arquivos de dados demonstrativos (Demo Data) e os ajustes nos scripts PHP que auditam e validam a estrutura do banco de dados (mecanismo de **Database Verification**).

---

## 2. Renomeação do Schema SQL Principal

1. **Renomear Arquivo Físico**:
   - `database/freeitsm.sql` -> `database/domus-desk.sql`

2. **Atualização de Conteúdo em [database/domus-desk.sql](file:///home/mmc/00_code/domus-desk/database/freeitsm.sql)**:
   - **Cabeçalho**:
     - De: `-- FreeITSM Database Schema (MySQL 8.0+)`
     - Para: `-- Domus Desk Database Schema (MySQL 8.0+)`
   - **Comentários de Tabelas**:
     - Substituir ocorrências em comentários explicativos sobre tenants, webchat e canais de mensageria (`provider='domus_desk'`).
   - **Credenciais e Comentários do Usuário Administrador Inicial**:
     - De: `-- Username: admin | Password: freeitsm`
     - Para: `-- Username: admin | Password: domusdesk` (ou `domus_desk`)

---

## 3. Atualização dos Arquivos de Demo Data (`database/demo-data/`)

Os arquivos de dados de demonstração contêm massa de teste importável via painel administrativo (**System > Demo Data**).

### 3.1. [database/demo-data/cmdb.json](file:///home/mmc/00_code/domus-desk/database/demo-data/cmdb.json)
- Identificadores de CIs (Configuration Items):
  - `d_freeitsm` -> `d_domus_desk`
  - `a_freeitsm` -> `a_domus_desk`
- Nomes de Itens de Configuração:
  - `FREEITSM` -> `DOMUS_DESK` (Classe de Banco de Dados)
  - `FreeITSM` -> `Domus Desk` (Classe de Aplicação)
- Relacionamentos entre CIs:
  - `from_object_id: @cmdb_objects.a_domus_desk` -> `to_object_id: @cmdb_objects.d_domus_desk`

### 3.2. [database/demo-data/lms.json](file:///home/mmc/00_code/domus-desk/database/demo-data/lms.json)
- Atualizar descrições de treinamentos: "Working a ticket in FreeITSM" -> "Working a ticket in Domus Desk".

### 3.3. [database/demo-data/network-mapper.json](file:///home/mmc/00_code/domus-desk/database/demo-data/network-mapper.json)
- Atualizar textos de rodapé dos diagramas de rede: "FreeITSM demo data" -> "Domus Desk demo data".

---

## 4. Atualização dos Scripts de Verificação de Schema (**Database Verification**)

O **Domus Desk** possui um sistema integrado de verificação de schema que compara o banco rodando em produção com o arquivo SQL fonte para detectar e aplicar migrations automaticamente.

### 4.1. [scripts/gen_db_verify_indexes.php](file:///home/mmc/00_code/domus-desk/scripts/gen_db_verify_indexes.php)
- Atualizar caminho do arquivo fonte SQL (linha 19):
  - De: `$sqlPath = $root . '/database/freeitsm.sql';`
  - Para: `$sqlPath = $root . '/database/domus-desk.sql';`
- Executar o script para regerar `includes/db_verify_indexes.php`.

### 4.2. [includes/db_verify_column_parse.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_column_parse.php)
- Linha 103:
  - De: `$sqlPath = $sqlPath ?? __DIR__ . '/../database/freeitsm.sql';`
  - Para: `$sqlPath = $sqlPath ?? __DIR__ . '/../database/domus-desk.sql';`
- Atualizar mensagens de log e avisos sobre divergências de coluna (`freeitsm.sql` -> `domus-desk.sql`).

### 4.3. [includes/db_verify_index_parse.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_index_parse.php)
- Linha 46:
  - De: `$sqlPath = $sqlPath ?? __DIR__ . '/../database/freeitsm.sql';`
  - Para: `$sqlPath = $sqlPath ?? __DIR__ . '/../database/domus-desk.sql';`

### 4.4. [includes/db_verify_schema.php](file:///home/mmc/00_code/domus-desk/includes/db_verify_schema.php)
- Atualizar comentários e referências ao arquivo SQL fonte no docstring do topo.
- Atualizar referências em comentários das tabelas `channels` e `messages` (`provider='domus_desk'`).

### 4.5. [api/system/db_verify.php](file:///home/mmc/00_code/domus-desk/api/system/db_verify.php)
- Verificar tratamentos de resposta do endpoint que faz a checagem e aplicação de correções no banco.

---

## 5. Estratégia de Migração para Bancos Existentes

Caso o ambiente já possua um banco de dados MySQL alimentado:
1. Executar query de migração na tabela `channels` para ajustar o canal de webchat:
   ```sql
   UPDATE channels SET provider = 'domus_desk' WHERE provider = 'freeitsm';
   ```
2. Caso a tabela `system_settings` ou `audit_logs` guarde valores de configuração legados, aplicar os updates correspondentes.

---

## 6. Próximos Passos
Prosseguir para a **[Etapa 04: Código-Fonte Backend (PHP, APIs e Provedores)](file:///home/mmc/00_code/domus-desk/docs/rename-project/04-backend-php-e-apis.md)**.
