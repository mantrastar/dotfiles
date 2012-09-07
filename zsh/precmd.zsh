# This function is called before the prompt is printed
precmd() {
  set_prompt
  title "zsh" "%1~"
}
