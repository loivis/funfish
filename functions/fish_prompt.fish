# https://github.com/loivis/funfish

function fish_prompt -d "Evolving Fish Prompt"
    __set_clock
    # __set_user
    __set_pwd
    __set_git
    __set_ending

    set_color normal
end

# function __set_user
#     set -l user (id -un $USER)
#     if [ $user = "root" ]
#         set_color $fish_color_cwd_root
#     else
#         set_color brblack
#     end
#     printf $user " "
# end

function __set_clock
    echo -sn (set_color brblack) (date "+%H:%M:%S %b %d")
    printf " "
end

function __set_pwd
    set -l dirname (dirname $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')
    echo -sn (set_color white) "$dirname/"
    # __update_left_prompt_length $dirname

    set -l basename (basename $PWD)
    echo -sn (set_color yellow) "$basename"
    # __update_left_prompt_length $basename

    set_color normal
end

function __set_ending
    set -l user (id -un $USER)

    set_color normal

    if [ $user = "root" ]
        set_color $fish_color_cwd_root
    else
        set_color green
        # ⌨ ⌘ ⎇ ❎ ☰ ☷ ⬣ ⬢ ⬟ ⨁ ⨂ ➤
    end

    printf "\n⎇  "
end

# function __set_right_prompt
#     set -l right_prompt (__get_right_prompt)
#     # remove color before caculating length
#     set -l right_prompt_clean (printf "$right_prompt" | sed "s:\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mK]::g")
#     # printf "$right_prompt_clean"
#     set space_count (math "$COLUMNS - $left_prompt_length - "(echo "$right_prompt_clean" | wc -c)"")
#     printf "%-"$space_count"s%s" " "
#     printf "$right_prompt\e[K"
# end

# function __get_right_prompt
#     set -l status_copy $status
#     set -l status_color 0fc

#     if test "$status_copy" -ne 0
#         set status_color f30
#     end

#     if test "$CMD_DURATION" -gt 100
#         set -l duration_copy $CMD_DURATION
#         set -l duration (echo $CMD_DURATION | humanize_duration)

#         echo -sn (set_color $status_color) "$duration"

#     else if set -l last_job_id (last_job_id -l)
#         echo -sn (set_color $status_color) "%$last_job_id"
#     else
#         echo -sn (set_color brblack) (date "+%H:%M:%S %b %d")
#     end

#     # echo -sn (set_color brblack) " | "

#     # set -l host_name (hostname -s)
#     # printf "$host_name\n"
# end


# function __update_left_prompt_length
#     set left_prompt_length (math "$left_prompt_length + "(echo "$argv" | wc -c))
# end

function __set_git
    if __fish_is_git_repository
        # https://fishshell.com/docs/current/cmds/fish_git_prompt.html#cmd-fish-git-prompt
        if not set -q __fish_git_prompt_show_informative_status
            set -g __fish_git_prompt_show_informative_status 1
        end

        if not set -q __fish_git_prompt_showupstream
            set -g __fish_git_prompt_showupstream "informative"
        end
        if not set -q __fish_git_prompt_char_upstream_ahead
            set -g __fish_git_prompt_char_upstream_ahead "↑"
        end
        if not set -q __fish_git_prompt_char_upstream_behind
            set -g __fish_git_prompt_char_upstream_behind "↓"
        end
        if not set -q __fish_git_prompt_char_upstream_prefix
            set -g __fish_git_prompt_char_upstream_prefix ""
        end


        if not set -q __fish_git_prompt_char_cleanstate
            set -g __fish_git_prompt_char_cleanstate "✔"
        end

        if not set -q __fish_git_prompt_showdirtystate
            set -g __fish_git_prompt_showdirtystate 1
        end
        if not set -q __fish_git_prompt_char_stagedstate
            set -g __fish_git_prompt_char_stagedstate "●"
        end
        # if not set -q __fish_git_prompt_color_stagedstate
        #     set -g __fish_git_prompt_color_stagedstate green
        # end
        if not set -q __fish_git_prompt_char_dirtystate
            set -g __fish_git_prompt_char_dirtystate "✚"
        end
        # if not set -q __fish_git_prompt_color_dirtystate
        #     set -g __fish_git_prompt_color_dirtystate yellow
        # end
        if not set -q __fish_git_prompt_char_invalidstate
            set -g __fish_git_prompt_char_invalidstate "✖"
        end
        # if not set -q __fish_git_prompt_color_invalidstate
        #     set -g __fish_git_prompt_color_invalidstate red
        # end

        if not set -q __fish_git_prompt_showstashstate
            set -g __fish_git_prompt_showstashstate 1
        end
        if not set -q __fish_git_prompt_char_stashstate
            set -g __fish_git_prompt_char_stashstate "⚑"
        end

        if not set -q __fish_git_prompt_showuntrackedfiles
            set -g __fish_git_prompt_showuntrackedfiles 1
        end
        if not set -q __fish_git_prompt_char_untrackedfiles
            set -g __fish_git_prompt_char_untrackedfiles "…"
        end


        if not set -q __fish_git_prompt_showcolorhints
            set -g __fish_git_prompt_showcolorhints 1
        end
        if not set -q __fish_git_prompt_color_branch
            set -g __fish_git_prompt_color_branch magenta --bold
        end
        if not set -q __fish_git_prompt_color_branch_detached
            set -g __fish_git_prompt_color_branch_detached red --bold
        end

        if not set -q __fish_git_prompt_color_untrackedfiles
            set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
        end
        if not set -q __fish_git_prompt_color_cleanstate
            set -g __fish_git_prompt_color_cleanstate green --bold
        end
        if not set -q __fish_prompt_normal
            set -g __fish_prompt_normal (set_color normal)
        end

        printf '%s' (__fish_vcs_prompt)
    end
end
