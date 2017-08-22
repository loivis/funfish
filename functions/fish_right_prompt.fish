function __print_color
    set -l color  $argv[1]
    set -l string $argv[2]

    set_color $color
    printf $string
    set_color normal
end

function fish_right_prompt
    set -l status_copy $status
    set -l status_color 0fc

    if test "$status_copy" -ne 0
        set status_color f30
    end

    if test "$CMD_DURATION" -gt 100
        set -l duration_copy $CMD_DURATION
        set -l duration (echo $CMD_DURATION | humanize_duration)

         echo -sn (set_color $status_color) "$duration" (set_color normal)

    else if set -l last_job_id (last_job_id -l)
         echo -sn (set_color $status_color) "%$last_job_id" (set_color normal)
    else
         echo -sn (set_color 555) (date "+%H:%M:%S %b %d") (set_color normal)
    end

    echo -e " | "

    set -l user (id -un $USER)
    set -l host_name (hostname -s)
    __print_color 555 "$user@$host_name"

end
