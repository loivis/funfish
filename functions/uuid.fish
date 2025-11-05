function uuid --description "Generate or convert UUIDs (with or without hyphens, lowercase, copied to clipboard)"
    set arg (string trim -- (string join "" $argv))
    set output ""

    # Case 1: No argument → generate UUID without hyphens
    if test -z "$arg"
        set output (uuidgen | string replace -a "-" "" | string lower)
    else if test "$arg" = "-"
        # Case 2: Single hyphen → generate UUID with hyphens
        set output (uuidgen | string lower)
    else
        # Case 3: Input UUID → convert format
        set arg (string lower $arg)
        if string match -rq -- "-" $arg
            set output (string replace -a "-" "" $arg)
        else
            if test (string length $arg) -ne 32
                echo "Invalid UUID format (should be 32 characters without hyphens)" >&2
                return 1
            end
            set output (string sub -s 1 -l 8 $arg)"-"(string sub -s 9 -l 4 $arg)"-"(string sub -s 13 -l 4 $arg)"-"(string sub -s 17 -l 4 $arg)"-"(string sub -s 21 $arg)
        end
    end

    # Copy to clipboard and print without newline
    echo -n $output | pbcopy && pbpaste && echo
end
