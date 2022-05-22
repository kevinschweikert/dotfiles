source ~/.asdf/asdf.fish

set EDITOR "nvim"
set TERM "xterm-256color"
set STARSHIP_CONFIG "~/.config/starship/config.toml"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -I --preserve-root'
alias ll="ls -la --color=auto"
alias sudo="sudo -i"
alias untar='tar -zxvf '
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias mount='mount |column -t'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'

alias apt-update="sudo apt update"
alias apt-upgrade="sudo apt upgrade"

alias nvimconf="nvim ~/.config/nvim/init.lua"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias vim="nvim"

starship init fish | source

fish_add_path -aP /home/kevin/scripts
