alias gs='git status -sb'
logfmt='%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'
alias glg="git log --graph --pretty=format:'$logfmt' --abbrev-commit --date=relative"
alias gd='git diff'
alias ga='git add'
alias gaa='git add .'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push origin HEAD'
alias gph='git push heroku master'
alias gf='git fetch origin'
alias gm='git merge'
alias gcl='git clone'

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
