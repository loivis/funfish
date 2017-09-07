alias hej='fuck'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias lla='ls -al'
alias tailf='tail -f'
alias pwgen='pwgen -1Bc 16'

# docker #
##########
alias sqlplus='docker run --rm -it loivis/sqlplus'

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
alias gcheckout='git checkout'
alias gdiff='git diff -w --ignore-blank-lines'
alias glog='git log --stat'
alias gpull='git pull'
alias gspop='git stash pop'
alias gstash='git stash'
alias gstatus='git status'
function gcommit
    git pull
    git commit -m "$argv[1]"
    git push
end

# code #
########
# path
alias coding='cd $CODE_BASE'
alias gogo="mkdir -p $GOPATH; and cd $GOPATH"
alias gopy='cd $CODE_BASE/python/'
alias gosh='cd $CODE_BASE/shell/'
# vscode
alias codefish='code ~/code/shell/github.com/loivis/funfish/'
