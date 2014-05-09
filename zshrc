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
PROMPT='%~: '
RPROMPT='[%* on %W]'

export EDITOR="vim"
export PAGER="most"
export PATH=$PATH:/home/ben/bin

autoload -U select-word-style
select-word-style bash

alias page="vim -u /usr/share/vim/vim73/macros/less.vim"

alias acs="apt-cache search"
alias sagi="sudo apt-get install"

for MACHINE in andre burberry ford mcqueen westwood sander conran
do
    alias ${MACHINE}="ssh -t ben@${MACHINE}.adm.thread.com screen -Dax"
done

for N in 1 2
do
    alias ps${N}="ssh -t ben@playfirestage${N}.com screen -Dax"
done

alias sacs="sudo apt-cache search"
alias sagi="sudo apt-get install"

alias bp="ssh -t ben@174.143.153.134 screen -Dax"

alias e="gvim -p"
alias se="sudo gvim -p"
alias v="vim"
alias i="feh"
alias g="git gui"
alias ip="ipython"
alias s="sudo --"
alias a="e *.py"

ep () {
	find ${@:-.} \
		-maxdepth 1 \
		-name "*.py" \
		-not \( -name "__init__.py" -size -2c \) \
		-not \( -lname '*' \) \
		-print0 \
	| xargs -0r gvim -p
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

m() {
    gvim -p /mnt/second/playfire/migrations/$1*.py
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
	scp $1 ben@ben-phillips.net:/home/ben/sites/ben-phillips.net.static/public/b/$2
}

redirect () {
	sudo iptables -t nat -A OUTPUT -d localhost -p tcp --dport ${2} -j REDIRECT --to-ports ${1}
}

sm() {
	cd ~/styleme/styleme
}
smt() {
	cd ~/styleme/templates
}

gp() {
	if [ -x "./manage.py" ]
	then
		find . -name "*.pyc" -delete
		./manage.py test --failfast "${@}" || return ${?}
		./manage.py lint
	fi

	git log origin.. --format="%s" | grep "^\.$" > /dev/null
	retval=$?
	if [ "$retval" -ne "0" ]; then
		git push
	else
		echo "You have unmanaged commits, please add messages."
	fi
}

ssw() {
	echo "Select a window..."
	_target="$(mktemp).png"
	scrot --select ${_target}
	imgur ${_target}
}

imgur() {
	for FILENAME in "$@"
	do
		curl --silent -F "image=@${FILENAME}" \
			-F "key=cca1d7195d0d8bd11f622cae37d375e0" \
			http://api.imgur.com/2/upload.xml | \
			grep -Eo "<original>(.)*</original>" | \
			grep -Eo "http://i.imgur.com/[^<]*";
	done
}

work() {
	if [ -f "/etc/hosts.play" ]
	then
		return 1
	fi

	sudo cp /etc/hosts /etc/hosts.play

	for HOSTNAME in reddit.com news.ycombinator.com facebook.com youtube.com news.bbc.co.uk twitter.com football365.com
	do
		echo "127.0.0.1	$HOSTNAME www.$HOSTNAME" | sudo tee -a /etc/hosts >/dev/null
	done

	echo "I: Entered work mode"
}

play() {
	if [ -f "/etc/hosts.play" ]
	then
		echo "I: Leaving work mode."
		sudo mv /etc/hosts.play /etc/hosts
	fi
}

commit() {
	google-chrome https://github.com/thread/styleme/commit/$1
}

ticket() {
	google-chrome https://thread.fogbugz.com/default.asp?$1
}
