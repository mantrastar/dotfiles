# Use hub as git wrapper
# https://github.com/defunkt/hub
hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

alias gs='git status -sb'
logfmt='%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'
alias glog="git log --graph --pretty=format:'$logfmt' --abbrev-commit --date=relative"
alias ga='git add'
alias gaa='git add .'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push origin HEAD'
alias gf='git fetch origin'
alias gm='git merge'
alias gcl='git clone'
