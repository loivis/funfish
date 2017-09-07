function ec2ins  -d 'list ec2 instances and connect if there is only one'
    set -l user "ubuntu"
    set -l identity "~/.ssh/id_rsa"
    set -l ssh_options "-o ConnectTimeout=5 -o StrictHostKeyChecking=no"

    set -l instances (aws ec2 describe-instances --region eu-west-1 \
        --filters "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]|[0]]' \
        --output text | sort -k3 | tr A-Z a-z)

    for ins in $instances
        if [ (string match -r $argv[1] $ins) ]
            echo $ins
        end
    end
end
