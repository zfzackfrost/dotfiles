alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias tkss="tmux kill-session"
alias tksv="tmux kill-server"

# Start tmuxp workspace
function swork() {
    local usage=""
    usage="${usage}"
    usage="${usage}Usage: swork [NAME_OR_DIR [DIR=\$PWD] [START_FILE]\n"
    usage="${usage}       OR\n"
    usage="${usage}       swork --init [DIR=\$PWD]\n"
    if [[ $# -eq 0 ]]; then
        echo $usage
        return 1
    fi
    if [[ "$1" = "--init" ]]; then
        local dst="$PWD"
        if [[ -d "$2" ]]; then
            dst="$2"
        fi
        cp "$MY_TMUXP_WORKSPACE" "$dst/.tmuxp.yaml"
        return 0
    fi
    if [[ -d "$1" ]]; then
        local old_pwd=$PWD
        cd "$1"; tmuxp load "$1"; cd "$old_pwd"
        return 0
    fi
    if [[ $1 = "-h" || $1 = "--help" || $1 = "-help" ]]; then
        echo $usage
        return 0
    fi
    export TMUXP_WORKSPACE_NAME="$1"
    export TMUXP_START_DIR="${2:-$PWD}"
    export TMUXP_START_FILE="${3:-}"
    tmuxp load workspace
}
