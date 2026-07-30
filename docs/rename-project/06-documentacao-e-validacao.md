# Etapa 06: Documentação, Metadados e Testes de Validação

## 1. Visão Geral
Esta etapa final contempla a atualização de toda a documentação pública e interna do repositório, ajustes de metadados no GitHub e a execução do plano completo de validação funcional e de regressão para homologar a renomeação para **Domus Desk**.

---

## 2. Atualização da Documentação do Repositório

### 2.1. [README.md](file:///home/mmc/00_code/domus-desk/README.md)
- **Badges e Links de Cabeçalho**:
  - Atualizar links do GitHub e domínios de demonstração (`github.com/edmozley/freeitsm` -> `github.com/edmozley/domus-desk`).
- **Comandos de Clonagem e Quickstart**:
  ```bash
  git clone https://github.com/edmozley/domus-desk.git
  cd domus-desk
  ./run.sh start
  ```
- **Credenciais Iniciais Padrão**:
  - `admin` / `domusdesk` (ou `domus_desk`)
- **Tabela de Recursos e Módulos**:
  - Atualizar os links da wiki e descrições dos 20+ módulos.

### 2.2. [LICENSE](file:///home/mmc/00_code/domus-desk/LICENSE) e [CHANGELOG.local.md](file:///home/mmc/00_code/domus-desk/CHANGELOG.local.md)
- Adicionar registro de alteração informando o rebranding oficial do projeto de **freeitsm** para **domus-desk**.

### 2.3. Templates do GitHub e Documentação Interna (`docs/` e `system/help/`)
- [.github/ISSUE_TEMPLATE/bug_report.md](file:///home/mmc/00_code/domus-desk/.github/ISSUE_TEMPLATE/bug_report.md): Atualizar texto dos templates de issue.
- **[docs/cmdb.md](file:///home/mmc/00_code/domus-desk/docs/cmdb.md)** e **[docs/webhook-cron-setup.md](file:///home/mmc/00_code/domus-desk/docs/webhook-cron-setup.md)**: Atualizar exemplos de payloads, diagramas e cabeçalhos `HTTP_X_DOMUS_DESK_SIGNATURE`.
- **[system/help/*.php](file:///home/mmc/00_code/domus-desk/system/help/analysts.php)**: Atualizar as páginas de ajuda interativa do painel administrativo.

---

## 3. Plano de Validação Pós-Renomeação

Após a aplicação de todas as etapas, a homologação deve seguir o protocolo abaixo:

### Passos de Teste e Verificação:

1. **Auditoria Estática de Código (Grep Audit)**:
   - Executar busca case-insensitive para garantir que não restaram ocorrências indesejadas:
     ```bash
     grep -rn "freeitsm" . --exclude-dir=.git --exclude-dir=node_modules
     ```
   - Verificar se as únicas ocorrências remanescentes são fallbacks intencionais de retrocompatibilidade.

2. **Teste de Compilação e Subida da Stack Docker**:
   ```bash
   ./run.sh start
   ```
   - Validar se os containers `domus-desk-app-1` e `domus-desk-db-1` sobem sem erros.
   - Verificar se o healthcheck do MySQL atinge o status `healthy`.

3. **Verificação do Banco de Dados (Database Verification)**:
   - Acessar `http://localhost:8080/system/db-verify` (ou via CLI/script).
   - Confirmar que o schema em execução corresponde exatamente ao `database/domus-desk.sql` e que todos os índices e colunas reportam `OK`.

4. **Teste de Login e Autenticação**:
   - Acessar `http://localhost:8080/login`.
   - Efetuar login com as credenciais padrão de admin.

5. **Teste do Canal de Webchat e API**:
   - Testar o envio e recebimento de mensagens no widget de webchat (`DomusDeskProvider`).
   - Acessar `http://localhost:8080/system/api/docs` e validar a renderização da documentação OpenAPI.

6. **Validação da Extensão do Navegador**:
   - Carregar a extensão em `browser-extension/` no Chrome/Edge em modo desenvolvedor.
   - Confirmar a conexão com `http://localhost:8080/` e a exibição do nome **Domus Desk Watchtower**.

---

## 4. Conclusão da Renomeação
Com a aprovação de todos os testes de validação, a branch `feature/rename-project-to-domus-desk` estará pronta para ser incorporada na branch principal (`main`).
