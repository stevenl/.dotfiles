export PATH="~/bin:$PATH"

# Source aliases
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Enable terminal colours
export CLICOLOR=1
# Make the colours brighter for better visibility
export LSCOLORS=Exfxcxdxbxegedabagacad

# Set the locale (to override en_NL, which is invalid)
export LC_ALL=en_GB.UTF-8

# Use vi-style key bindings (instead of emacs)
set -o vi

source ~/perl5/perlbrew/etc/bashrc
# local::lib should not be used with perlbrew
# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

# Display git repository info in the prompt
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" " \\\$ "'
GIT_PS1_SHOWCOLORHINTS=1
#GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
#GIT_PS1_SHOWUNTRACKEDFILES=1
