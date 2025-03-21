# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="dallas"
# ZSH_THEME="alanpeabody"
ZSH_THEME="dpoggi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode history-substring-search)
DISABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey "^[[A" history-substring-search-up
bindkey "^P" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^N" history-substring-search-down

setopt rm_star_silent

alias vi="vim"
alias tmux="tmux -u"
export EDITOR=vim

#export CC=/usr/bin/clang++

# Force color for terminals besides gnome-terminal.
export COLORTERM=gnome-terminal

