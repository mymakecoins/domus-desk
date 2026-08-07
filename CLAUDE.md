# CLAUDE.md — Domus Desk

## O que é isto
Plataforma ITSM (gestão de serviços de TI) auto-hospedada, gratuita e open source.
Monolito PHP + MySQL com 21+ módulos integrados — chamados, ativos, CMDB, mudanças,
problemas, base de conhecimento, LMS e portal de autoatendimento.

## Stack
- Linguagem: PHP 7.4–8.4, procedural/modular, **sem framework e sem Composer**
- Frontend: HTML server-rendered + JS vanilla + CSS, **sem build step**
- Banco: MySQL 8.0+ — schema em `database/domus-desk.sql`
- Infra: Docker Compose — subir com `./run.sh`, parar com `./run.sh stop`
- Testes: scripts PHP autônomos — `php tests/<área>/<arquivo>.php` (não há PHPUnit)
- Lint: não há ferramenta configurada — use `php -l <arquivo>` para checar sintaxe

## Disciplina Spec-Driven (inegociável)

Código é o **último** estágio aqui. O plugin MWTC Harness (`/sdd`) orquestra o
pipeline; o estado do projeto vive em `.brain/`.

Antes de escrever qualquer código:
1. Localize a feature em `.brain/02-features/<feature>/`
2. Leia os contratos: `00-prd.md`, `01-design.md`, `02-tasks.md`, `03-summa.md`
3. Leia `.brain/03-memory/gotchas.md` (seção Confirmed) para armadilhas conhecidas
4. Execute apenas as tarefas do Sprint atribuído em `02-tasks.md` — sem scope creep
5. Depois de implementar, `/sdd eval <sprint>` julga o trabalho antes do Sprint fechar

Se a pasta da feature não existir ou estiver incompleta:
- `/sdd new <nome>` → `/sdd prd` → `/sdd spec` → `/sdd review` (aprovação)
- NÃO improvise a spec escrevendo código primeiro

## Essenciais de estilo
- Consultas parametrizadas sempre. SQL concatenado com entrada de usuário é FAIL do Judge.
- Toda rota não pública verifica autenticação explicitamente — nunca por herança.
- Funções em `camelCase` com prefixo de área (`assetLabelUrl`, `capModules`); arquivos em `includes/` são `snake_case.php`.
- Grafia britânica no legado (`sanitise`, `colours`) — siga o arquivo que você está editando.
- Identificadores e comentários em **inglês**; docs, PRD/SPEC e commits em **pt-BR**.
- Regras completas: `.claude/rules/` (veja `language-policy.md`)

## Proteção de arquivos
O plugin bloqueia edições automáticas nos globs listados em `.brain/config.json`
(`write_block`): `.env*`, `config.php`, `database/db_config.php`,
`db_config.sample.php`. Ajuste a lista lá se um arquivo protegido precisar mesmo
ser editado.

## Onde encontrar as coisas
- Perfil do stack (comandos, convenções): `.brain/01-architecture/stack-profile.md`
- Conhecimento de negócio: `.brain/00-business/`
- Decisões de arquitetura: `.brain/01-architecture/adr/` e `ADR_001_DomusDesk_Arquitetura.md`
- Features e specs: `.brain/02-features/`
- Memória do time: `.brain/03-memory/gotchas.md`
- Config do harness (modelos, budgets, gates): `.brain/config.json`
- Ajuda do pipeline: `/sdd help` · Dashboard: `/sdd status`
