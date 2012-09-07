# Same as output from running `eval $( rbenv init -)`) 

# Load path
export PATH="$HOME/.rbenv/shims:$PATH"

# Completions
# From /usr/local/Cellar/rbenv/0.3.0/completions/rbenv.zsh
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _rbenv rbenv

_rbenv() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(rbenv commands)"
  else
    completions="$(rbenv completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

# Rehash shims whenever we open a shell
rbenv rehash 2>/dev/null

# Shell support
rbenv() {
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}
