function mkfile() {
    setopt shwordsplit globsubst local_options
    for f in $@; do
        mkdir -p `dirname "$f"` && touch "$f"
    done
}
alias mf="mkfile"

# "Fancy" reboot:
#   - Ask for confirmation
#   - Kill tmux server
#   - call `reboot`
function freboot() {
    if ask-yn "Reboot the system?" -d "y"; then
        if tmux ls >/dev/null 2>&1; then
            echo "Killing tmux server"
            tmux kill-server
            sleep 1
        fi
        exec reboot
    fi
}
