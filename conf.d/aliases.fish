alias download='cd ~/download'
alias hej='fuck'
alias https='http --default-scheme=https'
alias lla='ls -al'
alias passgen='pwgen -1Bc'
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
alias gdrive="code ~/gdrive"

# git #
#######
abbr -a g git
# alias geckout='git checkout'
# alias giff='git diff -w --ignore-blank-lines'
# alias glog='git log --stat -1'
# alias gop='git stash pop'
# alias gash='git stash'
# alias gatus='git status'
# alias gush='git push'
# function granch -d "actions to create a branch and push to remote"
#     if [ (count $argv) = 0 ]
#         echo "# usage:"
#         echo "create branch: -b branch/name"
#         echo "delete branch: -d branch/name"
#         return
#     end
#     if [ $argv[1] = "-b" ]
#         git pull
#         git checkout -b $argv[2]
#         git push -u origin $argv[2]
#         git branch -a
#     else if [ $argv[1] = "-d" ]
#         git stash
#         and git checkout master
#         and git stash pop
#         set -l exist (git ls-remote --heads origin $argv[2])
#         git branch -D $argv[2]
#         if [ "$exist" = "" ]
#             echo "branch $argv[2] doesn't exist on remote repository"
#         else
#             git push -d origin $argv[2]
#         end
#         git fetch origin --prune
#         git branch -a
#     end
# end
# function gadd -d "actions for git add"
#     git stash
#     and git pull --rebase
#     and git stash pop
#     # $status will be 1 if nothing stashed
#     git add $argv[1]
#     and git status
# end
# function gull -d "actions for git pull"
#     git stash
#     and git pull --rebase
#     and git stash pop
# end
# function gommit -d "actions for git commit"
#     git pull
#     and set -l message ""
#     if [ $argv[1] = "-d" ]
#         set message "DEVOPS-$argv[2]: $argv[3]"
#     else
#         set message "$argv[1]"
#     end
#     git commit -m "$message"
#     and git push --force-with-lease
# end
# function gamend -d "actions for git commit --amend"
#     git commit --amend --no-edit
#     and git push --force-with-lease
# end

# code #
########
# path
alias godocker='cd $HOME/docker'
alias gogo='cd $HOME/go/src'
alias gotv4='cd $HOME/go/src/github.com/TV4'
alias gopy='cd $HOME/python/'
alias gosh='cd $HOME/shell/'
# vscode
alias fishremote='code ~/shell/funfish/'
alias fishlocal='code ~/.config/fish'
