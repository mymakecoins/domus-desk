No Domus Desk, o controle de acesso e o design das telas são divididos principalmente entre três perfis/papéis de uso:

  1. Usuário Final / Requerente (End User): Colaborador ou cliente final da empresa que utiliza a TI para solicitar ajuda, abrir chamados e consumir informações.
  2. Analista de TI (TI Agent): Técnico/operador responsável por atender chamados, gerenciar ativos, criar documentações operacionais e solucionar problemas.
  3. Administrador do Sistema (System Admin): Profissional de TI responsável pelas parametrizações do sistema, segurança, integrações (SSO/LDAP), modelos de IA, regras RBAC e manutenção da infraestrutura da
  aplicação.
  ──────
  ### Visão Geral de Destino das Funcionalidades

  • Destinadas ao Usuário Final: O Portal de Autoatendimento (Self-Service Portal), onde ele pode abrir chamados, acompanhar suas solicitações, enviar gravações de tela, consultar a Base de Conhecimento
  pública, realizar treinamentos no LMS e checar a saúde dos serviços.
  • Destinadas ao Analista de TI: A Console Operacional ITSM, com todos os módulos do dia a dia (Caixa de Entrada de Chamados, Ativos, CMDB, Mudanças, Problemas, Tarefas, Checagens Matinais, etc.).
  • Destinadas ao Administrador: O Módulo Sistema, a Wiki do Sistema, as Configurações Globais de IA/SSO/LDAP, o Construtor de Workflows & Webhooks, o Gerenciador de RBAC e as ferramentas de manutenção de
  banco de dados (DB Verify).
  ──────
  ### Matriz de Relacionamento: Perfil vs. Funcionalidade

  Legenda:

  • 🟢 Total (Acesso completo / Criação / Edição / Exclusão / Configuração)
  • 🟡 Limitado / Operacional (Acesso de leitura, uso pessoal, abertura de itens ou atendimento delegado)
  • ⚪ Sem Acesso (Módulo restrito ou inacessível para este perfil)

   Módulo / Funcionalidade                           │            Usuário Final (Requerente)             │                  Analista de TI                   │             Administrador do Sistema
  ───────────────────────────────────────────────────┼───────────────────────────────────────────────────┼───────────────────────────────────────────────────┼──────────────────────────────────────────────────
   Portal de Autoatendimento ()                      │                     🟢 Total                      │                🟡 Leitura / Teste                 │                     🟢 Total
   Abertura e Acompanhamento de Chamados Próprios    │                     🟢 Total                      │                  🟡 Atendimento                   │                     🟢 Total
   Watchtower (Painel Unificado de Atenção)          │                   ⚪ Sem Acesso                   │                     🟢 Total                      │                     🟢 Total
   Atendimento de Chamados (Inbox, SLAs, CSAT)       │                   ⚪ Sem Acesso                   │                     🟢 Total                      │                     🟢 Total
   Tarefas (Kanban, Cronogramas internos)            │                   ⚪ Sem Acesso                   │                     🟢 Total                      │                     🟢 Total
   Gestão de Ativos & Leitor QR Code                 │                   ⚪ Sem Acesso                   │                     🟢 Total                      │                     🟢 Total
   Base de Conhecimento (Knowledge)                  │            🟡 Apenas Leitura (Pública)            │                 🟢 Autor / Editor                 │             🟢 Total / Administrador
   Gestão de Mudanças & Votação CAB                  │                   ⚪ Sem Acesso                   │                  🟢 Operacional                   │                     🟢 Total
   Gestão de Problemas (RCA, Erros Conhecidos)       │                   ⚪ Sem Acesso                   │                  🟢 Operacional                   │                     🟢 Total
   CMDB & Mapeador de Rede                           │                   ⚪ Sem Acesso                   │                  🟢 Operacional                   │                     🟢 Total
   Inventário de Software & Gestão de Licenças       │                   ⚪ Sem Acesso                   │              🟡 Consulta / Operação               │                 🟢 Administrador
   Formulários Dinâmicos                             │                 🟡 Preenchimento                  │              🟡 Preenchimento / Uso               │              🟢 Construtor / Editor
   Gestão de Contratos e Construtor RFP              │                   ⚪ Sem Acesso                   │               🟡 Leitura / Operação               │                     🟢 Total
   Status dos Serviços                               │              🟡 Visualização Pública              │             🟢 Atualização de Status              │                 🟢 Configuração
   Calendário da Equipe                              │                   ⚪ Sem Acesso                   │                     🟢 Total                      │                     🟢 Total
   Checagens Matinais da Infraestrutura              │                   ⚪ Sem Acesso                   │            🟢 Preenchimento / Leitura             │                     🟢 Total
   Relatórios e Trilha de Auditoria                  │                   ⚪ Sem Acesso                   │            🟡 Relatórios Operacionais             │               🟢 Total / Auditoria
   LMS (Treinamentos)                                │              🟡 Realização de Cursos              │               🟢 Aluno / Instrutor                │             🟢 Autor / Administrador
   Mapeador de Processos                             │                   ⚪ Sem Acesso                   │                🟢 Leitura / Edição                │                     🟢 Total
   Workflows & Webhooks (Automação Visual)           │                   ⚪ Sem Acesso                   │                   ⚪ Sem Acesso                   │                     🟢 Total
   Wiki do Sistema (System Wiki)                     │                   ⚪ Sem Acesso                   │                   ⚪ Sem Acesso                   │                     🟢 Total
   Módulo Sistema (SSO, LDAP, RBAC, IA, DB Verify)   │                   ⚪ Sem Acesso                   │                   ⚪ Sem Acesso                   │                     🟢 Total
  ──────
  ### Destaques das Restrições e Permissões

  1. Separação de Interfaces: O usuário final acessa a interface em index.php, que oculta menus técnicos e fornece navegação focada em autoatendimento.
  2. Granularidade RBAC: Analistas de TI podem ter acesso limitado a determinados módulos ou empresas (multi-tenancy) conforme o perfil configurado em roles.php.
  3. Exclusividade do Administrador: Configurações de chaves de API (OpenAI/Anthropic), conexões com Active Directory, gerenciamento de chaves de criptografia e o módulo técnico index.php requerem privilégios
  explicitamente definidos como administrador (is_admin = 1).