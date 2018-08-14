function profile -d "download profiles from gist"
    echo "download vimrc"
    set -l vimrc "https://gist.githubusercontent.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/vimrc"
    curl -sL -o $HOME/.vimrc $vimrc

    echo "download gitignore"
    set -l gitignore "https://gist.github.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/gitignore"
    curl -sL -o $HOME/.gitignore $gitignore
end
