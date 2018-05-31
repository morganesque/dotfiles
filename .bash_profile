# alias wowsa='pas wowza; ssh root@server6044.dedicated.webfusion.co.uk'
# alias common='pas common; ssh root@212.241.213.15'
PATH=$PATH:~/bin
PATH=$PATH:/usr/local/lib/node_modules/

# HISTORY stuff.
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100                      # big big history
export HISTFILESIZE=100                  # big big history
shopt -s histappend                      # append to history, don't overwrite it
export HISTTIMEFORMAT='%e %b %H:%M '
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# AMAZON WEB SERVICES stuff
PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin
export JAVA_HOME="/usr"
export AWS_AUTO_SCALING_HOME="/usr/local/bin/AutoScaling-1.0.61.5"
alias aws='ssh -vi ~/.ssh/aws-firsttry.pem ubuntu@ec2-54-209-147-26.compute-1.amazonaws.com'

# Update the tabname when running gulp.
alias gulp='tabname "running gulp"; gulp'

# A better name for the atom beta version.
alias btom='atom-beta'

# GIT stuff
# Adds everything in the current repo that isn't already.
alias gitad='git add --all :/'
alias gitcm='git commit -a'
# Does a 'fetch' before the 'status'
alias gitss='git fetch -v; git status'
# Unadds everything you current have added.
# alias gitrm='git rm -r --cached .'
# Pull latest version from guthub
alias githubpull='git pull origin'
# Tell git to start ignoring changes to files
alias gitig="git update-index --assume-unchanged"
# Tell git to stop ignoring changes to files
alias gitunig="git update-index --no-assume-unchanged"
# List the files for which changes are currently being ignored.
alias gitmu='git ls-files -v | grep ^[a-z]'
# Push everything from this repo up to heroku
alias githero="git push heroku master"
alias groot="cd `git rev-parse --show-toplevel`"

# tree is a command from ubuntu which creates a new tree structure view of the folders
alias tre="tree | less"

# BOWER
# Runs a search in bower for something.
alias bows="bower search"

# PROFILE STUFF
# edit your profile file
alias profile='vim ~/.bash_profile'
# implement any changes by re-source-ing.
alias sprofile='source ~/.bash_profile'
#
# userful helpers
alias help_phptopline='head -n 1 ~/bin/minifyJS';

alias npmlist="npm list --depth=0"
alias sd="npm start"
alias newpost="npm run newpost"
alias newshots="npm run newshots"
alias renamepost="npm run renamepost -- "
alias renew="npm run renew -- "
alias ninstall="npm install --save $1"

function tabname {
 printf "\e]1;$1\a"
}
function winname {
 printf "\e]2;$1\a"
}

# GENERAL BASH
# a friendlier filesize command.
alias dush="du -sch"
# Always use color output for `ls`
alias ls="ls -G"
# Additional ls aliases
alias ll="ls -ltr"
alias l.="ls -d .*"
# easier find usage
alias fn='find . -name'
# quicker history
alias hi='history | tail -20'

alias o="open"
alias oo="open ."

# Create a new directory and enter it
function md() {

  mkdir -p "$@" && cd "$@"

}

# go plugin
# Instructions on use: http://bit.ly/1cLyE9Q
export MARKPATH=$HOME/.marks
function go {
 cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
 mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
 rm -i "$MARKPATH/$1"
}
function marks {
 \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{
printf "%-10s -> %s\n", $1, $2
}'
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks go unmark

source ~/bin/acd_func.sh

# list npm
#function npmls() {
#  npm ls "$@" | grep ^[└├]
#}

# added git completions.
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

ulimit -n 1024

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Heroku MONGO
export MONGOLAB_URI=mongodb://heroku_rg3p4rkt:5j6gmvspis8jmaffalppkooiuu@ds019048.mlab.com:19048/heroku_rg3p4rkt

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
