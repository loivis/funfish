alias download='cd ~/download'
alias form='$HOME/python/bbr-infrastructure/bin/terraform'
alias generate='$HOME/python/bbr-infrastructure/bin/terraform-generate'
alias hej='fuck'
alias https='http --default-scheme=https'
alias lla='ls -al'
alias n='npm'
alias kube='kubectl'
alias kubedev='kubectl config set-context --current --namespace=develop'
alias kubeprod='kubectl config set-context --current --namespace=production'
alias opsbox='$HOME/python/bbr-infrastructure/bin/opsbox'
alias passgen='pwgen -1Bc'
alias repo="open (git remote get-url --push origin | awk '{print $2}' | sed 's#git@github.com:#https://github.com/#;s#\.git##')"
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias tailf='tail -f'
alias tmp='cd ~/tmp'
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
alias cpr="gh pr create --web"
alias mr="glab mr create --fill --fill-commit-body --no-editor --remove-source-branch --web"

# code #
########
# path
alias gosrc='cd $HOME/go/src'

# vscode
alias fishremote='code ~/shell/funfish/'
alias fishlocal='code ~/.config/fish'

# go
alias gomain='go run main.go'

# terragrunt
alias tg="AWS_SDK_LOAD_CONFIG=1 terragrunt"
alias tgp="tg plan"
alias tga="tg apply"
alias tgaa="tg apply -auto-approve"
