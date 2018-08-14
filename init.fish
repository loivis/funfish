# variable #
############
set -g CODE_BASE "$HOME/code"
set -g GOPATH "$HOME/go"

# PATH #
########
mkdir -p $GOPATH/ $GOPATH/bin
set PATH $GOPATH/bin $PATH
# set PATH /usr/local/lib/node_modules $PATH
set PATH "$HOME/dart/flutter/bin" $PATH
if [ -d /usr/local/opt/python/libexec/bin ]
    set PATH /usr/local/opt/python/libexec/bin $PATH
end

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
set -g PYTHONWARNINGS "ignore"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# vim #
#######
if [ ! -e ~/.vim/autoload/pathogen.vim ]
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
    git clone https://github.com/hashivim/vim-hashicorp-tools.git ~/.vim/bundle/vim-hashicorp-tools
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
end
