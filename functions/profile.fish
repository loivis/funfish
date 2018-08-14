function profile -d "download profiles from gist"
    echo "download .vimrc"
    set -l vimrc "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.vimrc"
    curl -sL -o $HOME/.vimrc $vimrc

    echo "download vim color scheme: jellybeans"
    mkdir -p $HOME/.vim/colors
    set -l jellybeans "https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim"
    curl -sL -o $HOME/.vim/colors/jellybeans.vim $jellybeans

    echo "download .gitconfig"
    set -l gitconfig "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.gitconfig"
    curl -sL -o $HOME/.gitconfig $gitconfig

    echo "download .gitignore"
    set -l gitignore "https://raw.githubusercontent.com/loivis/funfish/master/profiles/.gitignore"
    curl -sL -o $HOME/.gitignore $gitignore
end
