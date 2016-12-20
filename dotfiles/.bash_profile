# Source aliases
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Enable terminal colours
export CLICOLOR=1
# Make the colours brighter for better visibility
export LSCOLORS=Exfxcxdxbxegedabagacad

# Use vi-style key bindings (instead of emacs)
set -o vi

source ~/perl5/perlbrew/etc/bashrc
# local::lib should not be used with perlbrew
# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Display git repository info in the prompt
source ~/.dotfiles/bin/git-completion.bash
source ~/.dotfiles/bin/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " \\\$ "'
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Enable/disable proxies
function proxy() {
    local cmd=${1:-start}

    case "$cmd" in
        "on")
            export http_proxy=https://webproxy.corp.booking.com:3128/
            export https_proxy=$http_proxy
            export ftp_proxy=$http_proxy
            export rsync_proxy=$http_proxy
            export no_proxy=localhost,127.0.0.1,localaddress,.localdomain.com
            echo -e "Proxy environment variables ON"
            ;;
        "off")
            unset http_proxy
            unset https_proxy
            unset ftp_proxy
            unset rsync_proxy
            echo -e "Proxy environment variables OFF"
            ;;
    esac
}
