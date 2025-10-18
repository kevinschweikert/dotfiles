function kt -d "Kitty tab from dev projects"
    set -l projects_root $HOME/projects
    set -l path $projects_root/{personal,imen}
    set -l find_cmd "fd --type d --max-depth 1 . $path"

    set -l selected_dir (
        eval $find_cmd | fzf-tmux \
            -p \
            --cycle \
            --layout=reverse \
            --height=50% \
            --delimiter='/' \
            --with-nth='-3..-2' \
            --preview='CLICOLOR_FORCE=1 glow -p -w 100 -s dark {}/README.md 2>/dev/null || tokei {}' \
            --preview-window='70%' \
            --prompt 'project> ' \
            --bind="ctrl-n:execute(mkdir -p (fd --type d --max-depth 1 . $projects_root | fzf)/{q})+reload($find_cmd)" \
            --bind="del:execute(
                        if test (read -P 'Are you sure you want to delete {}? (y/N) ') = 'y';
                            rm -rf {};
                        end)+reload($find_cmd)" \
            --header-first \
            --header "Ctrl-n: new folder; Del: delete folder"
            
    )
    if test -n "$selected_dir"
        set -l tab_name (basename $selected_dir)
        kitty @ focus-tab --match title:$tab_name 2>/dev/null || kitty @ launch --type=tab --tab-title $tab_name --cwd $selected_dir fish -c "nvim +RestoreSession"
    end
end
