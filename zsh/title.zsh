title() {
  local cmd=${${1## *}[(w)1]}   # Get the command
  cmd=${cmd##*\/}               # Extract command basename
    
  case $TERM in
    xterm*)
      print -Pn "\e]2;%m ★ %n (%c) ⚡ $cmd\a"
      ;;
  esac
}


