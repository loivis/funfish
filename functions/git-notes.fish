function git-notes -d "notes for git cli command"
    echo '

# create new branch and push to remote
git checkout -b branch/name
git push -u origin branch/name

# delete local branch
git branch -d branch/name
git branch -D branch/name

# delete remote branch
git push -d origin branch/name

# delete non-existing-remote branch from local???
# NOT working
#git remote prune origin
#git fetch origin --prune

# remove from the working tree: untracked files, directories, ignored files, ignored and non-ignored files
git clean -f
git clean -fd
git clean -fX
git clean -fx

# git config
git config --global user.email "github@kinase.wang"
git config --global user.name "loivis"
# with file option
git config -f ~/.gitconfig.user user.email "github@kinase.wang"
git config -f ~/.gitconfig.user user.name "loivis"
# macos
git config --global credential.helper osxkeychain
# windows
git config --global credential.helper wincred
# linux
git config --global credential.helper cache
# 1 year = 60*60*24*365
# set 10 years
git config --global credential.helper 'cache --timeout=315360000'
'
end
