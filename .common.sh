# cmd to get the LAN IP
alias get_lan_ip="LAN_IP=\$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print \$2}' | head -n 1); echo \"Updated LAN IP to \${LAN_IP}:23123\""

# neovim
# export PATH="$PATH:/opt/nvim-linux64/bin"

export GIT_EDITOR=nvim # GIT using NVIM

alias nv="nvim"
alias vim="nvim"

# cmd to copy the current branch name to the clipboard
alias gC="git branch --show-current | pbcopy"

# cd to home
alias cdh="cd ~"
# cd to dotfile cfg directory
alias cdf="cd ~/.config/"
# cd to project directory
alias cdp="cd ~/projects"

