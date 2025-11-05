function profile -d "download profiles from gist"
    backup $HOME/.vimrc
    echo "downloading .vimrc"
    set -l vimrc "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.vimrc"
    curl -sL -o $HOME/.vimrc $vimrc

    echo "downloading vim color scheme: jellybeans"
    mkdir -p $HOME/.vim/colors
    set -l jellybeans "https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim"
    curl -sL -o $HOME/.vim/colors/jellybeans.vim $jellybeans

    backup $HOME/.gitconfig
    echo "downloading .gitconfig"
    set -l url "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.gitconfig"
    curl -sL -o $HOME/.gitconfig $url

    backup $HOME/.gitignore
    echo "downloading .gitignore"
    set -l url "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.gitignore"
    curl -sL -o $HOME/.gitignore $url
end

function backup --description "Backup a file by appending current date (YYYYMMDD), skip if file does not exist, or backup already"
    if test (count $argv) -ne 1
        echo "Usage: backup <file>" >&2
        return 1
    end

    set file $argv[1]

    # Skip if file doesn't exist
    if not test -e $file
        return 0
    end

    # Format: YYYYMMDD
    set date_str (date "+%Y%m%d")
    set backup_file "$file.$date_str"
    set base (basename $backup_file)

    # Skip if backup already exists
    if test -e $backup_file
        echo "$base exists already"
        return 0
    end

    echo "backup to $base"
    cp $file $backup_file
end
