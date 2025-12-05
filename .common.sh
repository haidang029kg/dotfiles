# cmd to get the LAN IP
alias get_lan_ip="LAN_IP=\$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print \$2}' | head -n 1); echo \"Updated LAN IP to \${LAN_IP}:23123\""

# neovim
# export PATH="$PATH:/opt/nvim-linux64/bin"

export GIT_EDITOR=nvim # GIT using NVIM

alias nv="nvim"
alias vim="nvim"

# cmd to copy the current branch name to the clipboard
alias gC="git branch --show-current | pbcopy"

# search git commits by message
alias glf="git log --color=always --format=\"%C(auto)%h%d %s %C(black)%C(bold)%cr\" | fzf --ansi --preview \"git show --color=always {1}\""

# exec docker container by container name
alias dex="docker exec -it \$(docker ps --format '{{.Names}}' | fzf) bash"

# save docker logs to log.log (default tail 1000 lines, or pass custom number)
dlogs() {
  local tail_lines=${1:-1000}
  docker logs --tail $tail_lines $(docker ps --format '{{.Names}}' | fzf) > log.log
}

