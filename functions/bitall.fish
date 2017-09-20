function bitall -d "pull all bitbucket repositories"
    set -l STARTING $PWD
    set -l BUCKET_BASE $HOME/code/tingcore
    set -l projects aws jenkins

    for proj in $projects
        cd $BUCKET_BASE
        set -l dirs (find ./$proj -mindepth 2 -maxdepth 2 -type d -name ".git")
        for dir in $dirs
            set -l repo (dirname $dir)
            cd $BUCKET_BASE/$repo
            echo "### $repo"; echo
            git pull
            echo; echo
        end
    end

    cd $STARTING
end
