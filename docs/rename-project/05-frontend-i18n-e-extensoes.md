# Etapa 05: Interface do Usuário, Internacionalização e Extensões

## 1. Visão Geral
Esta etapa detalha as alterações necessárias nos arquivos de internacionalização (`lang/`), na extensão do navegador (`browser-extension/`) e nos scripts clientes de inventário de ativos (`scripts/Invoke-AssetInventory.ps1`).

---

## 2. Arquivos de Internacionalização (`lang/`)

O sistema suporta 21 idiomas. A renomeação requer a substituição de rótulos, títulos de janela e mensagens explicativas em todas as línguas.

### Principais Arquivos e Padrões de Substituição:

1. **[lang/*/asset-management.php](file:///home/mmc/00_code/domus-desk/lang/en/asset-management.php)**:
   - Avisos de SSL em integrações: `FreeITSM will accept any TLS certificate...` -> `Domus Desk will accept any TLS certificate...`.
2. **[lang/*/cmdb.php](file:///home/mmc/00_code/domus-desk/lang/en/cmdb.php)**:
   - Diagramas de hierarquia: `Database (FREEITSM)` -> `Database (DOMUS_DESK)`.
   - Exemplos de relacionamentos entre CIs: `FREEITSM depends on AD` -> `DOMUS_DESK depends on AD`.
3. **[lang/*/contracts.php](file:///home/mmc/00_code/domus-desk/lang/en/contracts.php)**:
   - Descrições do RFP Builder e avisos de SSL do assistente de IA.
4. **[lang/*/lms.php](file:///home/mmc/00_code/domus-desk/lang/en/lms.php)**:
   - Títulos de página e guias: `FreeITSM — LMS Guide` -> `Domus Desk — LMS Guide`.
5. **[lang/*/network-mapper.php](file:///home/mmc/00_code/domus-desk/lang/en/network-mapper.php)**:
   - Títulos de janela e diagramas: `FreeITSM — Network Mapper` -> `Domus Desk — Network Mapper`.
6. **[lang/*/reporting.php](file:///home/mmc/00_code/domus-desk/lang/en/reporting.php)**:
   - Texto de introdução da área de logs do sistema.
7. **[lang/*/setup.php](file:///home/mmc/00_code/domus-desk/lang/en/setup.php)**:
   - Assistente de instalação inicial: `FreeITSM Setup` -> `Domus Desk Setup`.
8. **[lang/*/software.php](file:///home/mmc/00_code/domus-desk/lang/en/software.php)**:
   - Guias de coleta via agente PowerShell e gerenciamento de chaves de API.
9. **[lang/*/system.php](file:///home/mmc/00_code/domus-desk/lang/en/system.php)**:
   - Descrições de criptografia, SSO, mapeamento de atributos LDAP e chave de licença.
10. **[lang/*/tickets.php](file:///home/mmc/00_code/domus-desk/lang/en/tickets.php)** e **[lang/*/workflow.php](file:///home/mmc/00_code/domus-desk/lang/en/workflow.php)**:
    - Textos de ajuda, caixas de diálogo e caixas de aviso de automação.

---

## 3. Extensão de Navegador (`browser-extension/`)

A extensão para Chrome/Edge exibe o contador do **Watchtower** na barra de ferramentas do navegador.

### Alterações Específicas:

1. **[browser-extension/manifest.json](file:///home/mmc/00_code/domus-desk/browser-extension/manifest.json)**:
   ```json
   {
     "name": "Domus Desk Watchtower",
     "description": "Watchtower dashboard summary from your Domus Desk instance"
   }
   ```
2. **[browser-extension/options.html](file:///home/mmc/00_code/domus-desk/browser-extension/options.html)**:
   - Título: `<title>Domus Desk Watchtower — Settings</title>`
   - Dicas e placeholders: `https://itsm.example.com/domus-desk`, `The base URL of your Domus Desk installation`.
3. **[browser-extension/popup.js](file:///home/mmc/00_code/domus-desk/browser-extension/popup.js)**:
   - Mensagem de boas-vindas: `Welcome to Domus Desk Watchtower.`
   - Mensagem de falha de conexão: `Unable to connect to your Domus Desk instance.`
4. **[browser-extension/background.js](file:///home/mmc/00_code/domus-desk/browser-extension/background.js)** e **[browser-extension/options.js](file:///home/mmc/00_code/domus-desk/browser-extension/options.js)**:
   - Atualização dos comentários do Service Worker.

---

## 4. Script Coletor de Inventário PowerShell (`scripts/Invoke-AssetInventory.ps1`)

O script PowerShell roda nos computadores da empresa para coletar inventário de software e hardware e enviar para a API.

### Alterações em [scripts/Invoke-AssetInventory.ps1](file:///home/mmc/00_code/domus-desk/scripts/Invoke-AssetInventory.ps1):
- Comentários de ajuda e exemplos de sintaxe:
  - `.SYNOPSIS`: `posts it to Domus Desk.`
  - `.PARAMETER ServerUrl`: `The base URL of your Domus Desk instance (e.g. https://itsm.yourcompany.com).`
- Banner impresso no console (linha 41):
  - `Write-Host "Domus Desk Asset Inventory Collector" -ForegroundColor Cyan`

---

## 5. Próximos Passos
Prosseguir para a **[Etapa 06: Documentação, Metadados e Testes de Validação](file:///home/mmc/00_code/domus-desk/docs/rename-project/06-documentacao-e-validacao.md)**.
