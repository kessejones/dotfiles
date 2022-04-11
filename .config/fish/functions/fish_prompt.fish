# name: RobbyRussel
#
# You can override some default options in your config.fish:
#   set -g theme_display_git_untracked no

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    set -l show_untracked (git config --bool bash.showUntrackedFiles)
    set -l untracked
    if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
        set untracked '--untracked-files=no'
    end
    echo (command git status -s --ignore-submodules=dirty $untracked 2> /dev/null)
end

function fish_prompt
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l blue (set_color blue)
    set -l normal (set_color normal)

    if [ (_git_branch_name) ]
        set -l git_branch $red(_git_branch_name)

        set -l dirty ''
        if [ (_is_git_dirty) ]
            set dirty "$yellow ✗"
        end
        set git_info "$blue  $git_branch$blue$dirty "
    end

    set -l reset_color '394050'
    set -l cwd (basename (prompt_pwd))
    set -l background_color_cwd '49556a'
    set -l foreground_color_cwd grey

    set -l git_branch (_git_branch_name)
    set -l background_color_git '394050'
    set -l foreground_color_git red

    if test -n "$git_branch"
        _power_prompt --text="$cwd " --background=$background_color_cwd --foreground=$foreground_color_cwd --reset=$reset_color
        _power_prompt --text="$git_info" --background=$background_color_git --foreground=$foreground_color_git --reset=normal
    else
        _power_prompt --text="$cwd " --background=$background_color_cwd --foreground=$foreground_color_cwd --reset=normal
    end

    echo -n -s ' ' $normal
end

