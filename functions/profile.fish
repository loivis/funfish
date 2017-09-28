function profile -d "download profiles from gist"
    echo "download vimrc"
    set -l vimrc "https://gist.githubusercontent.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/e409003df973550080cb2dee23485fe47f00d8d5/vimrc"
    curl -s -o $HOME/.vimrc $vimrc

    echo "download gitignore_global"
    set -l gitignore_global "https://gist.githubusercontent.com/loivis/5f734a1eafe9cc03b1e62a879e422dcf/raw/f315325602be16770c775807fd854cab97ee62d3/gitignore_global"
    curl -s -o $HOME/.gitignore_global $gitignore_global
end
