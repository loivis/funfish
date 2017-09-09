function ec2ins -d 'list ec2 instances and connect if there is only one'
    set -l env
    set -l filter
    set -l user centos ec2-user
    set -l identity "~/.ssh/id_rsa"
    set -l ssh_options "-o ConnectTimeout=5 -o StrictHostKeyChecking=no"

    set -l instances (aws ec2 describe-instances --region eu-west-1 \
        --filters "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]|[0]]' \
        --output text | sort -k3 | tr A-Z a-z)

    for i in (seq 1 (count $argv))
        switch $argv[$i]
            case '-i'
                set identity $argv[(math $i + 1)]
            case '-e'
                set env $argv[(math $i + 1)]
                set identity "~/.ssh/$env.pem"
            case '-f'
                set filter $argv[(math $i + 1)]
        end
    end

    if [ -z "$filter" -a -n "$env" ]
        set filter $env
    end

    echo "ssh_options:" $ssh_options -i $identity

    echo "filter:" $filter

    for ins in $instances
        if [ (string match -r $filter $ins) ]
            echo $ins
        end
    end

end
