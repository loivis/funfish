# variable #
############
set -g CODE_BASE "$HOME/code"
set -g GOPATH "$CODE_BASE/go"

# PATH #
########
mkdir -p $GOPATH/ $GOPATH/bin
set PATH $GOPATH/bin $PATH
# set PATH /usr/local/lib/node_modules $PATH
if [ -d /usr/local/opt/python/libexec/bin ]
    set PATH /usr/local/opt/python/libexec/bin $PATH
end

# common #
##########
umask 022

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
    #git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone https://github.com/hashivim/vim-hashicorp-tools.git ~/.vim/bundle/vim-hashicorp-tools
    git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
    #pip3 install jedi && git clone https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
end

################################################################################
if [ ]
    echo "those shall NEVER be executed"
    git config --global core.excludesfile ~/.gitignore_global
    git config --global user.email "loivis@live.com"
    git config --global user.name "loivis"
    git config --global push.default simple
    # windows
    # git config --global credential.helper wincred
    # linux
    # git config --global credential.helper cache
    # 1 year = 60*60*24*365
    # set 10 years
    # git config --global credential.helper 'cache --timeout=315360000'
end
