# alias wowsa='pas wowza; ssh root@server6044.dedicated.webfusion.co.uk'
# alias common='pas common; ssh root@212.241.213.15'
PATH=$PATH:~tommo/bin

export HISTTIMEFORMAT='%e %b %H:%M '

# AWS stuff
export JAVA_HOME="/usr"
export AWS_AUTO_SCALING_HOME="/usr/local/bin/AutoScaling-1.0.61.5"
PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin

alias gulp='tabname "running gulp"; gulp'

alias aws='ssh -vi ~/.ssh/aws-firsttry.pem ubuntu@ec2-54-209-147-26.compute-1.amazonaws.com'

#
# git stuff
alias gitad='git add --all :/' # adds evereything in the current repo that isn't already.
alias gitcm='git commit -a'
alias gitss='git fetch -v; git status'
# alias gitrm='git rm -r --cached .' # unadds everything you current have added.
alias githubpull='git pull origin'        # pull latest version from guthub
alias gitmu='git ls-files -v | grep ^[a-z]' # list the files which are current to be treated as unchanged.
alias gitig="git update-index --assume-unchanged"
alias gitunig="git update-index --no-assume-unchanged"

alias bows="bower search"
alias dush="du -sh"
# alias spo="subl `ls -1d *sublime-project*`"

#
# profile stuff
alias profile='vim ~/.profile'
alias sprofile='source ~/.profile'

#
# userful helpers
alias help_phptopline='head -n 1 ~/bin/minifyJS';

# export PS1='\[\033[32m\w/\[\033[0m\]:$ ';
export PS1='\[\033[01;32m\]\w\[\033[00m\]:\$ ';

function tabname { printf "\e]1;$1\a" }
function winname { printf "\e]2;$1\a" }

# Always use color output for `ls`
alias ls="ls -G"

# Additional ls aliases
alias ll="ls -l"
alias l.="ls -d .*"

alias fn='find . -name'
alias hi='history | tail -20'

# Open files and directories
alias o="open"
alias oo="open ."

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# go plugin
# Instructions on use: http://bit.ly/1cLyE9Q
export MARKPATH=$HOME/.marks
function go { cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1" }
function mark { mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1" }
function unmark { rm -i "$MARKPATH/$1" }
function marks { \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}' }
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks go unmark

# list npm 
function npmls() {
  npm ls "$@" | grep ^[└├]
}

# added git completions.
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

ulimit -n 1024

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
