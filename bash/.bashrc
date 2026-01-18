# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
#export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

. "$HOME/.local/share/../bin/env"
alias btop='LC_NUMERIC=C btop'

# automation scripts
export PATH="$HOME/scripts:$PATH"

# tmuxifier for automating sessions
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
alias tmr="tmuxifier"

# show hidden files/folders with FZF
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow,hidden'
