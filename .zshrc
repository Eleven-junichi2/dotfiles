export PATH="/opt/homebrew/bin:$PATH"

# --My CLI app--
# Suketan
export PATH="$PATH:/Users/junic/Projects/MyWorks/suketan/dist"
# ----

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Created by `pipx` on 2025-03-23 05:48:17
export PATH="$PATH:/Users/junic/.local/bin"

. "$HOME/.local/bin/env"

# Added on 2025-05-07:
alias cot="open -a CotEditor"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/junic/.lmstudio/bin"
# End of LM Studio CLI section

#PROMPT='%n@%m:%~$ '

# --KDIX section--
# eval "$(/opt/homebrew/bin/brew shellenv)"

#PROMPT='%m:%~$ '
#PROMPT='kdix:%~$ '

# shell variables
export LANG=ja_JP.UTF-8
HISTSIZE=20000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:cd:pwd:ll:la:cl:df*:exit:j:fg:bg:ht:te:sr:mm:ns:su -'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color'
alias diff='diff -ub'

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#EOF

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
