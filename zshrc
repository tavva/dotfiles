# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

# options
setopt appendhistory autocd extendedglob nobeep

# emacs keybindings
bindkey -e

# tab-completion
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Prompt
PROMPT='%~: '
RPROMPT='[%* on %W]'

export EDITOR="vim"
export PAGER="most"
export PATH=$PATH:/home/ben/bin

autoload -U select-word-style
select-word-style bash

alias page="vim -u /usr/share/vim/vim73/macros/less.vim"

alias pf="cd /home/ben/playfire"

for MACHINE in koopa yoshi luigi wario birdo goomba pauline syrup toadette
do
    alias ${MACHINE}="ssh -t ben@${MACHINE}.playfire.com screen -Dax"
done

alias andre="ssh -t ben@andre.adm.heya.com screen -Dax"

for N in 1 2
do
    alias ps${N}="ssh -t ben@playfirestage${N}.com screen -Dax"
done

alias bp="ssh -t ben@174.143.153.134 screen -Dax"

alias e="gvim -p"
alias se="sudo gvim -p"
alias v="vim"
alias i="feh"
alias g="git gui"
alias ip="ipython"
alias s="sudo --"
alias a="e *.py"

alias gp='git push'
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

alias msshpf="mssh {koopa,yoshi,birdo,goomba}.playfire.com"

buildpf () {
    git fetch && git checkout master && git reset --hard origin/master && git clean -fxd && g4mer/manage.py build live
}

f () {
    grep -irn --exclude="*.pyc" $* .
}

alias quickweb='python -c "from SimpleHTTPServer import test; import sys; sys.argv = [None, 19028]; test()"'

alias org='e ~/org/main.org'

cdt () {
    cd $(mktemp -p ~/temp/ -td cdt.XXXXXXXX)
    echo "Moved to $(pwd)"
}

ff() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

m() {
    gvim -p ~/playfire/migrations/$1*.py
}

sync_phone() {
  if [ -d /mnt/phone/music ]
  then
    sudo rsync -rvvLtz --no-whole-file /home/ben/Music/nexus/ /mnt/phone/music/ --include="*/" --include="*.jpg" --include="*.mp3" --include="*.ogg" --exclude="*" --delete
  fi
}

_ss() {
	SCREENSHOT="$(mktemp)"
	rm -f ${SCREENSHOT}
	SCREENSHOT="${SCREENSHOT}.png"
}

ss () {
	_ss

	printf "Taking screenshot in "

	TIME=3
	while [ ${TIME} -gt 0 ]
	do
		printf "%d " ${TIME}
		sleep 1
		TIME=$((TIME - 1))
	done

	echo

	echo ${SCREENSHOT}

	scrot ${SCREENSHOT} && gimp ${SCREENSHOT} &
}

sss() {
	_ss
	echo "Select a window. Screenshot will be saved to: ${SCREENSHOT}"
	scrot --select ${SCREENSHOT} && gimp ${SCREENSHOT} &
}

pi() {
	scp $1 ben@ben-phillips.net:/home/ben/sites/ben-phillips.net/public/b/$2
}

redirect () {
	sudo iptables -t nat -A OUTPUT -d localhost -p tcp --dport ${2} -j REDIRECT --to-ports ${1}
}
