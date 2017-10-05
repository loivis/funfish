alias download='cd ~/download'
alias hej='fuck'
alias lla='ls -al'
alias pwgen='pwgen -1Bc 16'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias tailf='tail -f'

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
alias gadd='git pull;git add'
alias gamend='git commit --amend --no-edit; and git push -f'
alias geck='git checkout'
alias gmaster='git checkout master'
alias giff='git diff -w --ignore-blank-lines'
alias gog='git log --stat'
alias gull='git pull'
alias gop='git stash pop'
alias gash='git stash'
alias gatus='git status'
alias gush='git push'
alias gushbranch='git push -u origin'
function gommit
    git pull
    git commit -m "$argv[1]"
    git push -f
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
alias codefish='code ~/code/shell/github.com/loivis/funfish/'
