#!/usr/bin/env bash
# ==============================================================================
# Domus Desk - Script de Inicialização e Gestão em Containers
# ==============================================================================
# Este script verifica dependências do sistema, gerencia execuções anteriores
# e permite controlar todo o ciclo de vida da aplicação (Frontend, Backend PHP e MySQL)
# em containers Docker.
# ==============================================================================

set -eo pipefail

# Define diretório de execução para a raiz do repositório
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Estilos de Saída (Cores e Formatação)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[AVISO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERRO]${NC} $1"
}

banner() {
    echo -e "${BLUE}${BOLD}"
    echo "======================================================================"
    echo "                     Domus Desk - Docker Stack                        "
    echo "======================================================================"
    echo -e "${NC}"
}

show_help() {
    banner
    echo -e "${BOLD}Uso:${NC} ./run.sh [PARÂMETRO]"
    echo ""
    echo -e "${BOLD}Parâmetros disponíveis:${NC}"
    echo -e "  ${CYAN}(sem parâmetro)${NC}, ${CYAN}start${NC}, ${CYAN}--start${NC}, ${CYAN}up${NC}"
    echo -e "      Verifica dependências, derruba instâncias anteriores e sobe a stack (Build + Up)."
    echo ""
    echo -e "  ${CYAN}stop${NC}, ${CYAN}--stop${NC}, ${CYAN}down${NC}, ${CYAN}--down${NC}"
    echo -e "      Para e remove os containers e redes da aplicação."
    echo ""
    echo -e "  ${CYAN}restart${NC}, ${CYAN}--restart${NC}"
    echo -e "      Reinicia a aplicação (equivale a stop seguido de start)."
    echo ""
    echo -e "  ${CYAN}status${NC}, ${CYAN}--status${NC}, ${CYAN}ps${NC}"
    echo -e "      Exibe o estado atual dos containers."
    echo ""
    echo -e "  ${CYAN}logs${NC}, ${CYAN}--logs${NC}"
    echo -e "      Exibe e acompanha os logs dos containers em tempo real."
    echo ""
    echo -e "  ${CYAN}clean${NC}, ${CYAN}--clean${NC}, ${CYAN}--purge${NC}"
    echo -e "      Para os containers e apaga também os volumes de dados persistentes (Reset completo)."
    echo ""
    echo -e "  ${CYAN}help${NC}, ${CYAN}--help${NC}, ${CYAN}-h${NC}"
    echo -e "      Exibe esta mensagem de ajuda."
    echo ""
}

# ------------------------------------------------------------------------------
# Detectar Docker e Docker Compose
# ------------------------------------------------------------------------------
detect_docker() {
    if ! command -v docker &> /dev/null; then
        log_error "O utilitário 'docker' não foi encontrado no PATH."
        log_error "Instale o Docker (https://docs.docker.com/get-docker/) e tente novamente."
        exit 1
    fi

    if ! docker info &> /dev/null; then
        log_error "O daemon do Docker não está rodando ou o usuário atual não tem permissão."
        log_error "Certifique-se de que o Docker está ativo e seu usuário tem acesso."
        exit 1
    fi

    if docker compose version &> /dev/null; then
        DOCKER_COMPOSE="docker compose"
    elif command -v docker-compose &> /dev/null; then
        DOCKER_COMPOSE="docker-compose"
    else
        log_error "Docker Compose não foi encontrado."
        exit 1
    fi
}

stop_containers() {
    detect_docker
    log_info "Parando e removendo containers do Domus Desk..."
    $DOCKER_COMPOSE down --remove-orphans 2>/dev/null || true

    # Limpeza adicional de portas ou containers nomeados 'domus-desk'
    PORT_8080_CONTAINER=$(docker ps -q --filter "publish=8080" 2>/dev/null || true)
    PORT_3307_CONTAINER=$(docker ps -q --filter "publish=3307" 2>/dev/null || true)
    [ -n "$PORT_8080_CONTAINER" ] && docker stop "$PORT_8080_CONTAINER" &>/dev/null || true
    [ -n "$PORT_3307_CONTAINER" ] && docker stop "$PORT_3307_CONTAINER" &>/dev/null || true

    DOMUS_DESK_CONTAINERS=$(docker ps -a -q --filter "name=domus-desk" 2>/dev/null || true)
    [ -n "$DOMUS_DESK_CONTAINERS" ] && docker rm -f $DOMUS_DESK_CONTAINERS &>/dev/null || true

    log_success "Todos os containers foram parados e removidos com sucesso."
}

clean_all() {
    detect_docker
    log_warn "ATENÇÃO: Parando containers e removendo todos os volumes de dados persistentes..."
    $DOCKER_COMPOSE down --volumes --remove-orphans 2>/dev/null || true
    log_success "Aplicação e dados zerados com sucesso."
}

show_status() {
    detect_docker
    log_info "Estado atual dos containers do Domus Desk:"
    $DOCKER_COMPOSE ps
}

show_logs() {
    detect_docker
    log_info "Exibindo logs dos containers (Ctrl+C para sair)..."
    $DOCKER_COMPOSE logs -f
}

start_stack() {
    banner
    log_info "Verificando dependências e pré-requisitos do ambiente..."
    detect_docker
    log_success "Docker CLI instalado e daemon ativo."
    log_success "Docker Compose detectado: '$DOCKER_COMPOSE'."

    for req_file in "docker-compose.yml" "Dockerfile" "database/domus-desk.sql" "docker/entrypoint.sh"; do
        if [ ! -f "$req_file" ]; then
            log_error "Arquivo obrigatório não encontrado: $req_file"
            exit 1
        fi
    done
    log_success "Todos os arquivos de configuração necessários foram encontrados."

    log_info "Verificando execuções anteriores ativas..."
    stop_containers > /dev/null 2>&1 || true
    log_success "Ambiente limpo de execuções anteriores."

    log_info "Iniciando a compilação e subida dos containers (App PHP/Frontend + MySQL DB)..."
    $DOCKER_COMPOSE up --build -d

    log_info "Aguardando inicialização e healthcheck do banco de dados MySQL..."
    MAX_ATTEMPTS=30
    ATTEMPT=1
    DB_READY=false

    while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
        DB_STATUS=$(docker inspect --format='{{json .State.Health.Status}}' domus-desk-db-1 2>/dev/null || docker inspect --format='{{json .State.Health.Status}}' domus_desk_db_1 2>/dev/null || echo '"unknown"')
        if [[ "$DB_STATUS" == '"healthy"' ]]; then
            DB_READY=true
            break
        fi
        if $DOCKER_COMPOSE exec -T db mysqladmin ping -h localhost --silent &>/dev/null; then
            DB_READY=true
            break
        fi
        echo -n "."
        sleep 2
        ATTEMPT=$((ATTEMPT + 1))
    done
    echo ""

    if [ "$DB_READY" = true ]; then
        log_success "Banco de dados MySQL pronto e aceitando conexões!"
    else
        log_warn "Healthcheck não respondeu a tempo, prosseguindo com a verificação final..."
    fi

    RUNNING_SERVICES=$($DOCKER_COMPOSE ps --services --filter "status=running")
    if echo "$RUNNING_SERVICES" | grep -q "app" && echo "$RUNNING_SERVICES" | grep -q "db"; then
        log_success "Todos os containers (App + DB) estão em execução com sucesso!"
    else
        log_error "Um ou mais containers falharam ao iniciar."
        $DOCKER_COMPOSE ps
        exit 1
    fi

    echo ""
    echo -e "${GREEN}${BOLD}======================================================================${NC}"
    echo -e "${GREEN}${BOLD}          Domus Desk inicializado com sucesso em containers!          ${NC}"
    echo -e "${GREEN}${BOLD}======================================================================${NC}"
    echo ""
    echo -e "${BOLD}Acesso à Aplicação Web:${NC}"
    echo -e "  • URL do Sistema:     ${CYAN}http://localhost:8080/${NC}"
    echo -e "  • Assistente Setup:   ${CYAN}http://localhost:8080/setup/${NC}"
    echo ""
    echo -e "${BOLD}Credenciais Padrão de Acesso:${NC}"
    echo -e "  • Usuário Admin:      ${YELLOW}admin${NC}"
    echo -e "  • Senha Inicial:      ${YELLOW}domus_desk${NC}"
    echo ""
    echo -e "${BOLD}Dados de Conexão com o Banco de Dados (MySQL):${NC}"
    echo -e "  • Host / Porta:       ${CYAN}localhost:3307${NC} (interno container: db:3306)"
    echo -e "  • Banco de Dados:     ${CYAN}domus_desk${NC}"
    echo -e "  • Usuário DB:         ${CYAN}domus_desk${NC}"
    echo -e "  • Senha DB:           ${CYAN}domus_desk${NC}"
    echo -e "  • Senha Root DB:      ${CYAN}rootpassword${NC}"
    echo ""
    echo -e "${BOLD}Comandos Úteis:${NC}"
    echo -e "  • Ver Logs em tempo real:   ${CYAN}./run.sh logs${NC}"
    echo -e "  • Status dos containers:    ${CYAN}./run.sh status${NC}"
    echo -e "  • Parar a aplicação:        ${CYAN}./run.sh stop${NC}"
    echo -e "${GREEN}${BOLD}======================================================================${NC}"
}

# ------------------------------------------------------------------------------
# Roteamento dos Parâmetros via CLI
# ------------------------------------------------------------------------------
ACTION="${1:-start}"

case "$ACTION" in
    start|--start|up|"")
        start_stack
        ;;
    stop|--stop|down|--down)
        stop_containers
        ;;
    restart|--restart)
        stop_containers
        start_stack
        ;;
    status|--status|ps)
        show_status
        ;;
    logs|--logs)
        show_logs
        ;;
    clean|--clean|--purge)
        clean_all
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        log_error "Parâmetro desconhecido: '$ACTION'"
        echo ""
        show_help
        exit 1
        ;;
esac
