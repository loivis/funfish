function goup -d "update go version in a git repository"
    if test (count $argv) -eq 0
        echo "version not provided"
        return
    end

    set -l v $argv[1]
    echo "updating to Go$v"

    # Update all go.mod files
    for f in **/go.mod
        test -f $f; and sed -i '' "s/^go .*/go $v/g" $f
    end

    # Update all .gitlab-ci.yml files recursively
    for f in **/.gitlab-ci.yml
        if test -f "$f"
            sed -i '' \
                -e "s/go:1.*/go:$v/" \
                -e "s/GO_VERSION: 1.*/GO_VERSION: $v/" \
                "$f"
        end
    end
end

function letsgo -d ""
    if test (count $argv) -eq 0
        echo "version not provided"
        return
    end

    git d && \
    git branch -D h/go 2>/dev/null; git push origin --delete h/go 2>/dev/null; git sc h/go && \
    goup $argv[1] && \
    git aa && git csm "Update Go $argv[1]" && mr
end
