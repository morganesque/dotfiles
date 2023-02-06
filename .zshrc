echo "sourcing ~/.zshrc baby!"

# Always use color output for `ls`
alias ls="ls -G"

# Easier editting this file (especially from elsewhere)
alias profileedit="vim ~/.zshrc"
alias profilesource="source ~/.zshrc"

alias gitlog="git log --name-status"
alias gitss="git status"

# Additional ls aliases
alias ll="ls -ltr"

# easier find usage
alias fn='find . -name'

# quicker history
alias hi='history | tail -20'
alias hh='history | tail -20'

# easier open
alias o="open"
alias oo="open ."

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# PROMPT='%F{green}%~%f:: '

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%F{green}%~%f %F{yellow}$(parse_git_branch)%f%F{normal} $%f '
# export PROMPT='%F{grey}%n%f %F{cyan}%~%f%F{green}$(parse_git_branch)%f %F{normal}$%f '
