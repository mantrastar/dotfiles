# Case insensitive matches
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Use ls colors for display
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Menu selection style 
zstyle ':completion:*:default' menu select
