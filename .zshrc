#!/bin/zsh


# new machine:
# defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
# defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# sourcing
if [[ -f ~/.tc_settings ]]; then
  source ~/.tc_settings
  alias st='source $HOME/.tc_settings'
fi

if [[ -f ~/.personal ]]; then
  source ~/.personal
  alias st='source $HOME/.personal'
fi

#_______ZSH STUFF_________
if [[ -f ~/.oh-my-zsh ]]; then
  source ~/.oh-my-zsh
fi


ZSH_THEME=""
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
plugins=(git)
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
autoload -U promptinit; promptinit
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
prompt pure

#_______GIT STUFF_________
alias g='git'
alias gi='git init'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcob='git checkout -b'
alias gm='git merge'
alias gst='git stash'
alias gsp='git stash pop'
alias gl='git log'
alias gd='git diff'
alias gf='git checkout `git branch --format="%(refname:short)" | fzf`'
alias gdel='git branch -d'
alias gpom='git pull origin master'
alias nah="git reset --hard"


function gac() {
    git add .
    git commit -a -m "$1"
}
function gacp() {
    git add .
    git commit -a -m "$1"
    git push
}
# broken by vim-startify
function changed() {
  vim -O $(git status --porcelain | awk '{print $2}')
}

# reset file path from git head
function reset() {
  git checkout head -- "$1"
}



#___________GENERAL__________
export TERM="xterm-256color"
alias ..='cd ..'
alias c=code
alias v='vim -S ~/.vimrc'
alias vim='vim -S ~/.vimrc'
alias q=r
alias stats="watch -n1 istats --no-graphs"
set editing-mode v
function qq() { 
  fc -lim "*$@*" 1 
}

# sourcing
alias sz='source $HOME/.zshrc'
alias ve='v $HOME/.vimrc'
alias ze='v $HOME/.zshrc'
alias te='v $HOME/.tc_settings'
alias n='v $HOME/notes.md'
alias notes='v $HOME/notes.md'

# tags
alias ctags="`brew --prefix`/bin/ctags"
alias t='vim -t "$(cut -f1 tags | tail +7 | uniq | fzf)"'
alias tags="ctags -R --exclude=node_modules --exclude=public --exclude=vendor --exclude=db --exclude=tmp"


# FZF
alias vf='vim "$(fzf)"'
export FZF_DEFAULT_OPTS="--bind tab:up,shift-tab:down"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='Rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
fi

# kill ruby rails server
function kill() {
  kill -9 $(lsof -i tcp:3000 -t)
}

alias rag='vim `rg "what" | fzf`'

function regex() {
  gawk 'match($0,/'$1'/, ary) {print ary['${2:-'0'}']}'
}

function git_repo() {
  if [ ! -d .git ] ;
    then echo "ERROR: This isnt a git directory" && return false;
  fi

  git config --get remote.origin.url | regex "\/(.*)\.git" 1
}



# add ripgrep stuff


# graveyard
# # OLD BASH STUFF
# reset_color="\033[0m"
# git_clean_color="\033[0;32m"
# git_dirty_color="\033[0;31m"
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }
# parse_color() {
#     if ! git rev-parse --git-dir > /dev/null 2>&1; then
#         return 0
#     fi
#     git_color=${reset_color}
# # git diff-index --quiet
#     if [ -z "$(git status --untracked-files=no --porcelain)" ];
#     # if [[ -z $(git status -s) ]];
#     then
#         git_color=${git_clean_color}
#     else
#         git_color=${git_dirty_color}
#     fi
#     echo -e $git_color
# }
# export PS1="\[\$(parse_color)\]\$(parse_git_branch)\[\e[0m\] \W \$ "
# setopt PROMPT_SUBST
# autoload -U colors && colors
# export PS1="\$(parse_color)\$(parse_git_branch) $fg[white]%1d \$ "
# #function changes() {
    #code `git changed`
    ## default input to current branch + master
    #for i in $(git changed)
    #do
        #code $i
    #done
    #echo $arr
#}
#function gfind() {
    #declare -a arr
    #phrase=""
    #for word in "$@"
    #do
        #phrase+="$word"
        #phrase+="-"
    #done

    #for i in `git branch -l | grep "${phrase%?}"`

    #do
        #arr+=("$i")
        ## echo $i
    #done
    ## echo $arr
    #for i in ${!arr[@]};
    #do
        #echo $i: ${arr[$i]}
    #done

    #read index
    #git checkout ${arr["$index"]}

    ## echo each element w/ index
    ## read number
    ## git checkout array[number]
    ## return matching branches and number them to select from
#}

# bash -> zsh changes
# alias q='fc -s'



# tree navigation
#function fd() {
    #if [[ "$#" != 0 ]]; then
        #builtin fd "$@";
        #return
    #fi
    #while true; do
        #local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        #local dir="$(printf '%s\n' "${lsd[@]}" |
            #fzf --preview '
                #__fd_nxt="$(echo {})";
                #__fd_path="$(echo $(pwd)/${__fd_nxt} | sed "s;//;/;")";
                #echo $__fd_path;
                #echo;
                #ls -p "${__fd_path}";
        #')"
        #[[ ${#dir} != 0 ]] || return 0
        #builtin fd "$dir" &> /dev/null
    #done
#}
## fh - repeat history
#qq() {
  #eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
#}

source /Users/d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
