function fish_command_not_found
    if status is-interactive; and test (count $argv) -eq 1; and test -d "$argv[1]"
        builtin cd -- $argv[1]
    else
        __fish_default_command_not_found_handler $argv
    end
end
