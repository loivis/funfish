function terracore -d "wrapper for terraform from hashicorp"
    set -g AWS_DEFAULT_REGION "eu-west-1"

    if [ ! -s "$HOME/.terraformrc" ]
        echo "plugin_cache_dir = \"$HOME/.terraform.d/plugin-cache\"" > $HOME/.terraformrc
    end

    if [ (count $argv) -eq 0 ]
        terraform help
        return
    end

    # if [ ! -d ".terraform" ]
    #     terraform init
    # end

    switch $argv[1]
        case plan
            terraform get;
            and terraform validate;
    end
    and terraform $argv
end
