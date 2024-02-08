function goup -d "update go version in a git repository"
    if test (count $argv) -eq 0
        echo "version not provided"
        return
    end

    set -l ver $argv[1]
    echo "updating to Go$ver"

    sed -i '' "s/^go .*/go $ver/g" **/go.mod
    sed -i '' "s/^GO_VERSION .*/GO_VERSION := go$ver/g" **/Makefile
    sed -i '' "s/go_version: \".*\"/go_version: \"$ver\"/g" .github/**/*.yml
end
