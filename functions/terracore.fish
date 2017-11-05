function terracore -d "wrapper for terraform from hashicorp"
    set -g AWS_DEFAULT_REGION "eu-west-1"
    if [ (count $argv) -eq 0 ]
        terraform help
        return
    end

    if [ ! -d ".terraform" ]
        terraform init
    end

    switch $argv[1]
        case plan
            terraform validate
            terraform get
    end
    terraform $argv
end
