# https://github.com/loivis/funfish

function fish_prompt -d "Evolving Fish Prompt"
    set -l last_status $status
    set -g left_prompt_length 0

    set_color -b black
    __set_user
    printf " "
    __set_pwd
    printf " "
    __set_git
    printf "\e[K\n"
    set_color normal
    set_color green
    printf "⌨  "
    set_color normal
end

function __set_user
    set -l user (id -un $USER)
    set_color white
    printf $user
    __update_left_prompt_length $user
end

function __set_pwd
    set -l pwd (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')
    set_color cyan
    printf "$pwd"
    __update_left_prompt_length $pwd
end

function __update_left_prompt_length
    set left_prompt_length (math "$left_prompt_length + "(echo "$argv" | wc -c))
end

function __git_upstream_configured
    git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
end

function __print_color
    set -l color  $argv[1]
    set -l string $argv[2]

    set_color $color
    printf $string
end

function __set_git
    if git_is_repo
        set -l branch_name (git_branch_name)
        set -l git_branch_glyph

        __print_color white "["
        __print_color blue "$branch_name"
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

        __print_color 6597ca "$git_branch_glyph"

        if __git_upstream_configured
             set -l git_ahead (command git rev-list --left-right --count HEAD...@"{u}" ^ /dev/null | awk '
                $1 > 0 { printf("⇡") } # can push
                $2 > 0 { printf("⇣") } # can pull
             ')

             if test ! -z "$git_ahead"
                __print_color 5DAE8B " $git_ahead"
            end
        end

        __print_color white "]"
    end
end
