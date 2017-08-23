# https://github.com/loivis/funfish

function fish_prompt -d "Evolving Fish Prompt"
    set -l last_status $status
    set -g left_prompt_length 0
    set -g space_count 0

    set_color -b black

    __set_user
    printf " "
    __set_pwd
    printf " "
    __set_git
    __set_right_prompt
    __set_ending

    set_color normal
end


function __set_user
    set -l user (id -un $USER)
    if [ $user = "root" ]
        set_color $fish_color_cwd_root
    else
        set_color brblack
    end
    printf $user
    __update_left_prompt_length $user
end

function __set_pwd
    set -l dirname (dirname $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')
    echo -sn (set_color white) "$dirname/"
    __update_left_prompt_length $dirname

    set -l basename (basename $PWD)
    echo -sn (set_color yellow) "$basename"
    __update_left_prompt_length $basename
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

function __set_right_prompt
    set -l right_prompt (__get_right_prompt)
    # remove color before caculating length
    set -l right_prompt_clean (printf "$right_prompt" | sed -r "s:\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mK]::g")
    # printf "$right_prompt_clean"
    set space_count (math "$COLUMNS - $left_prompt_length - "(echo "$right_prompt_clean" | wc -c)"")
    printf "%-"$space_count"s%s" " "
    printf "$right_prompt\e[K"
end

function __get_right_prompt
    set -l status_copy $status
    set -l status_color 0fc

    if test "$status_copy" -ne 0
        set status_color f30
    end

    if test "$CMD_DURATION" -gt 100
        set -l duration_copy $CMD_DURATION
        set -l duration (echo $CMD_DURATION | humanize_duration)

         echo -sn (set_color $status_color) "$duration"

    else if set -l last_job_id (last_job_id -l)
         echo -sn (set_color $status_color) "%$last_job_id"
    else
         echo -sn (set_color brblack) (date "+%H:%M:%S %b %d")
    end

    echo -sn (set_color brblack) " | "

    set -l host_name (hostname -s)
    printf "$host_name\n"
end


function __update_left_prompt_length
    set left_prompt_length (math "$left_prompt_length + "(echo "$argv" | wc -c))
end

function __git_upstream_configured
    git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
end

function __set_git
    if git_is_repo
        set -l branch_name (git_branch_name)
        set -l git_branch_glyph

        echo -sn (set_color brblack) "["
        echo -sn (set_color cyan) "$branch_name"
        __update_left_prompt_length "$branch_name"

        if git_is_touched
            if git_is_staged
                if git_is_dirty
                    set git_branch_glyph " ±"
                else
                    set git_branch_glyph " +"
                end
            else
                set git_branch_glyph " ?"
            end
            set left_prompt_length (math "$left_prompt_length + 2")
        end

        echo -sn (set_color brcyan) "$git_branch_glyph"

        if __git_upstream_configured
             set -l git_ahead (command git rev-list --left-right --count HEAD...@"{u}" ^ /dev/null | awk '
                $1 > 0 { printf("⇡") } # can push
                $2 > 0 { printf("⇣") } # can pull
             ')

             if test ! -z "$git_ahead"
                echo -sn (set_color brcyan) " $git_ahead"
                __update_left_prompt_length "$git_ahead"
            end
        end

        echo -sn (set_color brblack) "]"
        set left_prompt_length (math "$left_prompt_length + 1")
    end
end
