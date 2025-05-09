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
# fzf tokionight theme
set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

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

source $XDG_CONFIG_HOME/fish/colors/tokyonight.fish

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
