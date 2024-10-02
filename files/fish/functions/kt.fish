function kt -d "Kitty tab from dev projects"
    set -l path $HOME/projects/{personal,imen}
    set -l selected_dir (
        fd --type d --max-depth 1 . $path |
        fzf-tmux -p --cycle --layout=reverse --height=50% --delimiter / --with-nth -3..-2 --preview='CLICOLOR_FORCE=1 glow -p -w 100 -s dark {}/README.md 2>/dev/null || tokei {}' --preview-window='70%' --prompt 't> '
    )
    if test -n "$selected_dir"
        set -l tab_name (basename $selected_dir)
        kitty @ focus-tab --match title:$tab_name 2>/dev/null || kitty @ launch --type=tab --tab-title $tab_name --cwd $selected_dir fish -c nvim
    end
end
