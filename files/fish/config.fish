if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    pfetch
end

set -x EDITOR nvim
set -x VISUAL nvim

set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac --with-ssl=$(brew --prefix openssl@3)"
set -x KERL_BUILD_DOCS yes
set -x CFLAGS "-O2 -g -march=native"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias ls='eza --color=auto --hyperlink'
alias ll="ls -la"
alias sudo="sudo -i"
alias untar='tar -zxvf '
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias mount='mount |column -t'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias g='git'
alias rg='rg --hyperlink-format=kitty'
alias fnvim='nvim (fzf)'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

source $XDG_CONFIG_HOME/fish/colors/tokyonight.fish

fish_add_path /opt/homebrew/bin
source /opt/homebrew/opt/asdf/libexec/asdf.fish
starship init fish | source
zoxide init --cmd cd fish | source
zellij setup --generate-completion fish | source
fzf --fish | source
