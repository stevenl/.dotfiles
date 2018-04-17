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

# Display git repository info in the prompt
source ~/.dotfiles/bin/git-completion.bash
source ~/.dotfiles/bin/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " \\\$ "'
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Configure and unconfigure proxy variables as requred by apps
proxy () {
    PROXYADDR="http://webproxy.corp.booking.com:3128"
    OPTION="$1"
    if [ "$OPTION" == "0" ] || [ "$OPTION" == "off" ] || [ "$OPTION" == "no" ]; then
        unset http_proxy
        unset https_proxy
        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset no_proxy

        printf "Proxy off\n"
    elif [ "$OPTION" == "1" ] || [ "$OPTION" == "on" ] || [ "$OPTION" == "yes" ]; then
        export http_proxy="$PROXYADDR"
        export https_proxy="$PROXYADDR"
        export HTTP_PROXY="$PROXYADDR"
        export HTTPS_PROXY="$PROXYADDR"
        export no_proxy="localhost,127.0.0.1"

        printf "Proxy configured to $PROXYADDR\n"
    else
        printf "http_proxy=$http_proxy\n"
        printf "https_proxy=$https_proxy\n"
        printf "HTTP_PROXY=$HTTP_PROXY\n"
        printf "HTTPS_PROXY=$HTTPS_PROXY\n"
        printf "Please use 0/1, on/off, yes,no\n"
    fi
}
