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
        case init
            rm -rf ./.terraform/;
        case plan
            rm -rf ./.terraform/modules/;
            and terraform get -update;
            and terraform validate;
            set argv $argv -out=plan.out;
        case apply
            set argv $argv plan.out;
    end
    and terraform $argv
end
