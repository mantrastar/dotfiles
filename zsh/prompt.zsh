autoload colors && colors

git_branch() {
  ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
  echo "%{$fg[magenta]%}${ref#refs/heads/}"
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo ""
    else
      echo "%{$fg_bold[cyan]%}(!)"
    fi
  fi
}

host_name() {
  echo "%{$fg_bold[blue]%}%m"
}

directory_name() {
  echo "%{$fg[red]%}%c"
}

user_name() {
  echo "%{$fg[green]%}★ %n"
}

reset_color() {
  echo "%{$reset_color%}"
}

set_prompt() {
  export PROMPT=$'\n$(host_name) $(user_name) $(directory_name) ⚡  $(reset_color)'
  export RPROMPT="$(git_branch)$(git_dirty)$(reset_color)"
}
