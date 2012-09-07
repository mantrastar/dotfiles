export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36;1:ln=35;1:so=32;1:pi=33;1:ex=31;1:bd=34;36:cd=34;33:su=0;31:sg=0;36:tw=0;32:ow=0;33:"
export CLICOLOR=true

HISTFILE=$DOT/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE 
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS 
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
# setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
