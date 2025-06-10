if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    pfetch
end

set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPAGER "nvim +Man!"

set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac --with-ssl=$(brew --prefix openssl@3)"
set -x KERL_BUILD_DOCS yes
set -x CFLAGS "-O2 -g -march=native"
set -x FZF_DEFAULT_COMMAND 'fd . --hidden --exclude ".git"'
set -x MIX_OS_DEPS_COMPILE_PARTITION_COUNT 5
set -x XDG_CONFIG_HOME $HOME/.config

# fzf catpuccin moccha
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

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

# Elixir Aliases
alias s='iex --dot-iex ~/.iex.exs -S mix phx.server'
alias i='iex --dot-iex ~/.iex.exs -S mix'
alias mdg='mix deps.get'
alias mes='mix ecto.setup'
alias mec='mix ecto.create'
alias med='mix ecto.drop'
alias mer='mix ecto.reset'
alias mgm='mix gettext.extract --merge'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# brew install caarlos0/tap/timer
# brew install terminal-notifier
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

fish_add_path /opt/homebrew/bin

if status is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end

starship init fish | source
zoxide init --cmd cd fish | source
# zellij setup --generate-completion fish | source
fzf --fish | source
direnv hook fish | source

# uv
fish_add_path "/Users/kevinschweikert/.local/bin"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
