function profile -d "download profiles from gist"
    echo "download vimrc"
    set -l vimrc "https://gist.githubusercontent.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/vimrc"
    curl -sL -o $HOME/.vimrc $vimrc

    echo "download gitignore_global"
    set -l gitignore_global "https://gist.github.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/gitignore_global"
    curl -sL -o $HOME/.gitignore_global $gitignore_global
end
