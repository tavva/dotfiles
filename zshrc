# history
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=$HISTSIZE

if [ -n "$DISPLAY" ]; then
    xset b off
fi

# options
setopt appendhistory autocd extendedglob nobeep hist_ignore_all_dups

# emacs keybindings
bindkey -e

# tab-completion
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Prompt
PROMPT="%~: "
RPROMPT="%F{253}%B%m%b%f %w %T"

export EDITOR="vim"
export PAGER="most"

autoload -U select-word-style
select-word-style bash

#Virtualenvwrapper settings:
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/ben/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

export FLYCTL_INSTALL="/home/ben/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

alias acs="apt-cache search"
alias sagi="sudo apt-get install"

alias sacs="sudo apt-cache search"
alias sagi="sudo apt-get install"

alias i="feh"
alias a="ack-grep --skipped --text --smart-case --ignore-dir=\"migrations\""

ep () {
    find ${@:-.} \
        -maxdepth 1 \
        -name "*.py" \
        -not \( -name "__init__.py" -size -2c \) \
        -not \( -lname '*' \) \
        -print0 \
    | xargs -0r vim --remote-silent
}

alias gb='git branch'
alias gc='git checkout'
alias gm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status -sb'
alias gpr='git pull --rebase'
alias gl='git log'
alias ga='git add -p'
alias gg='/usr/lib/git-core/git-gui'
alias gam='git commit --amend'

f() {
    echo
    grep -irn --exclude="*.pyc" --exclude-dir="*migrations*" $* .
}

alias quickweb='python -m SimpleHTTPServer'

cdt() {
    cd $(mktemp -d --tmpdir=/home/ben/temp cdt.XXXXXXXXX)
    echo "Moved to $(pwd)"
}

ff() {
    echo
    echo "find . -iname \"*$1*\""
    echo
    find . -iname "*$1*"
}

autoload -U zmv
alias mmv='noglob zmv -W'

source "$HOME/.zsh/spaceship/spaceship.zsh"
# Display username always
SPACESHIP_TIME_SHOW=always
# Setting prefix and suffix for docker_context section
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
# Replacing docker with docker_context
spaceship remove docker
spaceship add docker_context
