alias gs='git status -sb'
logfmt='%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'
alias glg="git log --graph --pretty=format:'$logfmt' --abbrev-commit --date=relative"
alias gd='git diff'
alias ga='git add'
alias gaa='git add --all .'
alias grm="git status | sed -nE 's/^.*deleted:[[:space:]]+//p' | while read -r line; do git rm "$line"; done"
alias gc='git commit'
alias gcm='git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gp='git push origin HEAD'
alias gph='git push heroku master'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gm='git merge --no-ff --edit'
alias gcl='git clone'
alias gup='git fetch origin; git merge --ff-only @{u}'
alias grb='git rebase -p @{u}'

gac() {
  # Quickly add and commit in one step, with default commit message.

  # Check number of arguments.
  if [ $# -eq 1 ]
  then
    message="Work on $1"
  elif [ $# -gt 1 ]
  then
    message="Work"
  else
    echo 'Provide file or pattern to add and commit.'
    return 1
  fi 
 
  # Add.
  ga $@

  # Commit.
  gc -m $message $@
}
