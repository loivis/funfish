alias download='cd ~/download'
alias hej='fuck'
alias lla='ls -al'
alias pwgen='pwgen -1Bc 16'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias tailf='tail -f'
alias tmp='cd /tmp'

# docker #
##########
alias cqlsh='docker pull loivis/cqlsh >/dev/null; and docker run --rm -it loivis/cqlsh --cqlversion=3.4.0'
alias dangling='docker images -f dangling=true -aq | xargs docker rmi -f'
alias sqlplus='docker pull loivis/sqlplus >/dev/null; and docker run --rm -it loivis/sqlplus'

# directory #
#############
abbr -a -- - 'cd -'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# git #
#######
alias gamend='git commit --amend --no-edit; and git push -f'
alias geck='git checkout'
alias gmaster='git checkout master'
alias giff='git diff -w --ignore-blank-lines'
alias gog='git log --stat -1'
alias gull='git pull --rebase'
alias gop='git stash pop'
alias gash='git stash'
alias gatus='git status'
alias gush='git push'
alias gushbranch='git push -u origin'
function gadd -d "actions for git add"
    git stash;
    and git pull --rebase;
    and git stash pop;
    # $status will be 1 if nothing stashed
    git add $argv[1];
    and git status
end
function gommit -d "actions for git commit"
    git pull;
    and git commit -m "$argv[1]";
    and git push -f
end

# code #
########
# path
alias coding='cd $CODE_BASE'
alias godocker='cd $CODE_BASE/docker'
alias gogo='mkdir -p $GOPATH; and cd $GOPATH'
alias gopy='cd $CODE_BASE/python/'
alias gosh='cd $CODE_BASE/shell/'
# vscode
alias fishrepo='code ~/code/shell/github.com/loivis/funfish/'
alias fishlocal='code ~/.config/fish'
