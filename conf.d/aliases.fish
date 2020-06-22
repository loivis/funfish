alias download='cd ~/download'
alias hej='fuck'
alias https='http --default-scheme=https'
alias lla='ls -al'
alias passgen='pwgen -1Bc'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias tailf='tail -f'
alias tmp='cd ~/tmp'
alias opsbox='$HOME/python/bbr-infrastructure/bin/opsbox'
alias form='$HOME/python/bbr-infrastructure/bin/terraform'
alias generate='$HOME/python/bbr-infrastructure/bin/terraform-generate'
function mkcd -d "create new directory and cd to it"
    mkdir -p $argv[1]
    and cd $argv[1]
end

# docker #
##########
alias cqlsh='docker pull loivis/cqlsh >/dev/null; and docker run --rm -it loivis/cqlsh --cqlversion=3.4.0'
alias sqlplus='docker pull loivis/sqlplus >/dev/null; and docker run --rm -it loivis/sqlplus'
alias hiro='docker pull loivis/hiro >/dev/null; and docker run --rm -v (pwd):/docs loivis/hiro'
# cleanup
alias drm='docker ps -aq --filter "name=_" | xargs docker rm -f; docker images -f dangling=true -aq | xargs docker rmi -f'

# directory #
#############
abbr -a -- - 'cd -'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias gdrive="code ~/gdrive"

# git #
#######
abbr -a g git

# code #
########
# path
alias gosrc='cd $HOME/go/src'

# vscode
alias fishremote='code ~/shell/funfish/'
alias fishlocal='code ~/.config/fish'

# go
alias gomain='go run main.go'
