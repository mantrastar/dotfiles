title() {
  local cmd=${${1## *}[(w)1]}   # Get the command
  cmd=${cmd##*\/}               # Extract command basename
    
  local dir=$2
  dir=$(print -Pn "%16>...>$2")
    
  case $TERM in
    xterm*)
      print -Pn "\e]2;$cmd ($dir)\a"
      ;;
  esac
}


