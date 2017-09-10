alias hej='fuck'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias lla='ls -al'
alias tailf='tail -f'
alias pwgen='pwgen -1Bc 16'

# docker #
##########
alias sqlplus='docker run --rm -it loivis/sqlplus'
alias cqlsh='docker run --rm -it loivis/cqlsh --cqlversion=3.4.0'

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
    git push
end

# code #
########
# path
alias coding='cd $CODE_BASE'
alias godocker='cd $CODE_BASE/docker'
alias gogo="mkdir -p $GOPATH; and cd $GOPATH"
alias gopy='cd $CODE_BASE/python/'
alias gosh='cd $CODE_BASE/shell/'
# vscode
alias codefish='code ~/code/shell/github.com/loivis/funfish/'
