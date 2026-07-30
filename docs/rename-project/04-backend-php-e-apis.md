# Etapa 04: Código-Fonte Backend (PHP, APIs e Provedores)

## 1. Visão Geral
Esta etapa cobre as modificações no código PHP do backend, incluindo a refatoração de classes de mensageria, ajustes nos módulos de segurança e criptografia, integração com provedores de IA, e endpoints da API REST v1.

---

## 2. Refatoração do Provedor de Mensageria (Webchat Interno)

O sistema de mensageria utiliza uma arquitetura de provedores abstratos para integrar canais (Email, WhatsApp, Webchat). O webchat nativo é controlado por um provedor self-hosted.

### 2.1. Renomeação do Arquivo e da Classe PHP
1. **Renomear Arquivo**:
   - `includes/messaging/FreeitsmProvider.php` -> `includes/messaging/DomusDeskProvider.php`
2. **Atualizar Definição da Classe em [includes/messaging/DomusDeskProvider.php](file:///home/mmc/00_code/domus-desk/includes/messaging/FreeitsmProvider.php)**:
   ```php
   // De:
   class FreeitsmProvider extends MessagingProvider

   // Para:
   class DomusDeskProvider extends MessagingProvider
   ```

### 2.2. Atualização da Fábrica de Provedores em [includes/messaging/messaging.php](file:///home/mmc/00_code/domus-desk/includes/messaging/messaging.php)
- Carregamento do arquivo:
  ```php
  require_once __DIR__ . '/DomusDeskProvider.php';
  ```
- Método de fabricação com suporte a retrocompatibilidade:
  ```php
  switch ($channel['provider']) {
      case 'domus_desk':
      case 'domus-desk':
      case 'freeitsm': // Fallback temporário para instalações existentes
          return new DomusDeskProvider($channel);
      ...
  }
  ```

---

## 3. Módulo de Criptografia e Chaves (`includes/encryption.php`)

O arquivo [includes/encryption.php](file:///home/mmc/00_code/domus-desk/includes/encryption.php) é responsável pela criptografia AES-256-GCM dos segredos do sistema.

### Alteração Necessária:
- Atualizar o caminho padrão de fallback da chave no servidor (linha 25):
  ```php
  // De:
  : '/var/www/encryption_keys/freeitsm.key';

  // Para:
  : '/var/www/encryption_keys/domus_desk.key';
  ```

---

## 4. Integração com Provedores de IA (`includes/ai_provider.php`)

Ao realizar chamadas para provedores LLM (OpenAI, OpenRouter, Anthropic), o sistema envia identificadores no cabeçalho HTTP.

### Alteração em [includes/ai_provider.php](file:///home/mmc/00_code/domus-desk/includes/ai_provider.php):
- Linhas 77-78:
  ```php
  // De:
  $extraHeaders[] = 'HTTP-Referer: ' . ($opts['referer'] ?? 'https://freeitsm.co.uk');
  $extraHeaders[] = 'X-Title: ' . ($opts['title'] ?? 'FreeITSM');

  // Para:
  $extraHeaders[] = 'HTTP-Referer: ' . ($opts['referer'] ?? 'https://domusdesk.com');
  $extraHeaders[] = 'X-Title: ' . ($opts['title'] ?? 'Domus Desk');
  ```

---

## 5. Demais Módulos Auxiliares em `includes/`

- **[includes/ldap.php](file:///home/mmc/00_code/domus-desk/includes/ldap.php)**: Atualizar mensagens legíveis em exceções de autenticação ("No Domus Desk account exists for that user...").
- **[includes/lms_package.php](file:///home/mmc/00_code/domus-desk/includes/lms_package.php)**: Atualizar exceções de validação de arquivos SCORM ("The package contains a file Domus Desk will not host...").
- **[includes/tenancy.php](file:///home/mmc/00_code/domus-desk/includes/tenancy.php)**: Atualizar documentação em bloco PHP.

---

## 6. API REST v1 e Documentação Interativa

### 6.1. Especificação OpenAPI e Bootstrap (`api/v1/`)
- **[api/v1/openapi.php](file:///home/mmc/00_code/domus-desk/api/v1/openapi.php)** e **[api/v1/lib/openapi.php](file:///home/mmc/00_code/domus-desk/api/v1/lib/openapi.php)**:
  - Atualizar o título da API: `Domus Desk REST API v1`.
  - Atualizar descrições de recursos e esquemas de autenticação Bearer token.

### 6.2. Documentação Interativa na UI (`system/api/docs.php`)
- **[system/api/docs.php](file:///home/mmc/00_code/domus-desk/system/api/docs.php)**:
  - Chaves de `localStorage` para teste de API no navegador:
    - `freeitsm_api_docs_lang` -> `domus_desk_api_docs_lang`
    - `freeitsm_api_test_key` -> `domus_desk_api_test_key`
  - Títulos da página: `<code style="font-size:20px;">Domus Desk REST API v1</code>`.

---

## 7. Próximos Passos
Prosseguir para a **[Etapa 05: Interface do Usuário, Internacionalização e Extensões](file:///home/mmc/00_code/domus-desk/docs/rename-project/05-frontend-i18n-e-extensoes.md)**.
