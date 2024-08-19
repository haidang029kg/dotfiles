# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"
export GIT_EDITOR=nvim # GIT using NVIM 

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export PATH="/usr/local/go/bin:$PATH"

# java
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

#spark
export PATH=$PATH:/opt/spark/bin

