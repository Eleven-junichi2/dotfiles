export PATH="/opt/homebrew/bin:$PATH"

export LANG=ja_JP.UTF-8
HISTSIZE=20000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth

alias ls="eza"
# alias cat="bat"
# alias find="fd"
alias grep="rg" # ripgrep
alias cd="z" # zoxide
alias mkdirdate="mkdir $(date +%Y-%m-%d_%H-%M-%S)"

# --My CLI app
# Suketan
export PATH="$PATH:$HOME/Projects/MyWorks/suketan/dist"
# --

# --Android Development
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
# --

# --Created by `pipx` on 2025-03-23 05:48:17
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.local/bin/env"
# --

# --CotEditor
# alias cot="open -a CotEditor"
# --

# --KDIX
# eval "$(/opt/homebrew/bin/brew shellenv)"
#PROMPT='%m:%~$ '
#PROMPT='kdix:%~$ '
# --?

# --nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# --

# --zoxide
eval "$(zoxide init zsh)"
# --

# --Welcome Script
fastfetch
# --

# --Starship - Custom Shell Prompt
eval "$(starship init zsh)"
# --

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
