function tscript -d "parse and run script in .travis.yml"
    if [ ! -f ".travis.yml" ]
        echo ".travis.yml missing"
        return
    end

    yaml2json .travis.yml | jq -r ".script|select (.!=null)|.[]" | sh
end
