function bw-personal
    set -x BITWARDENCLI_APPDATA_DIR ~/.config/bitwarden-cli/personal
    bw $argv
end
