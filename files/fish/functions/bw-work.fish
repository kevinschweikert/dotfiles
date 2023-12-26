function bw-work
    set -x BITWARDENCLI_APPDATA_DIR ~/.config/bitwarden-cli/work
    bw $argv
end
