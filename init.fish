# PATH #
########
# set PATH /usr/local/lib/node_modules $PATH
set PATH "$HOME/go/bin" $PATH
set PATH "$HOME/.cargo/bin" $PATH
set PATH "$HOME/dart/flutter/bin" $PATH
if [ -d /usr/local/opt/python/libexec/bin ]
    set PATH /usr/local/opt/python/libexec/bin $PATH
end

# set CDPATH
set CDPATH . $HOME $HOME/go/src/github.com/ $CDPATH

# common #
##########
umask 022

# awscli #
##########
# set -x AWS_PROFILE "master"
# set -x AWS_DEFAULT_REGION "eu-west-1"
# # assume role for amazon-ecr-credential-helper
# set -x AWS_SDK_LOAD_CONFIG true

# python #
##########
# export PYTHONWARNINGS="default"
# set -g PYTHONWARNINGS "ignore"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# vault
set -x VAULT_ADDR https://vault.b17g.services
set -x VAULT_FORMAT json

# brew #
########
for formulae in "ag" "fzf" "httpie" "tig"
    which $formulae >/dev/null
    or brew install $formulae
end
# vim #
#######
if [ ! -e ~/.vim/autoload/pathogen.vim ]
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
    git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
    git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
    git clone https://github.com/hashivim/vim-hashicorp-tools.git ~/.vim/bundle/vim-hashicorp-tools
    git clone https://github.com/Raimondi/delimitMate.git ~/.vim/bundle/delimitMate
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/terryma/vim-multiple-cursors ~/.vim/bundle/vim-multiple-cursors
    git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
end
