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
setopt EXTENDED_GLOB

setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Directory switching
cdpath=(~ ~/Universe)
setopt autopushd
setopt autocd
