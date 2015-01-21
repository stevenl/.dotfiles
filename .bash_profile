# Set proxies
export http_proxy=https://webproxy.corp.booking.com:3128/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# Enable terminal colours
export CLICOLOR=1
# Make the colours brighter for better visibility
export LSCOLORS=Exfxcxdxbxegedabagacad

# Use vi-style key bindings (instead of emacs)
set -o vi

# Display git repository info in the prompt
source ~/.dotfiles/git-completion.bash
source ~/.dotfiles/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " \\\$ "'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

# Connect to vpn via OpenVPN/Tunnelblick
# Usage: vpn start|stop
function vpn() {
    local cmd=${1:-start}

    case "$cmd" in
        "start")
            ssh -fN vpn
            open /Applications/Tunnelblick.app
            osascript -e 'tell application "Tunnelblick"' -e 'connect "Booking"' -e 'end tell'
            ;;

        "stop")
            ps aux | grep 'ssh -fN vpn' | grep -v grep | awk '{print "kill -9 " $2}' | sh
            osascript -e 'tell application "Tunnelblick" to quit'
            ;;
    esac
}

