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

'
end
