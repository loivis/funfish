function ec2ins -d 'list ec2 instances and connect if there is only one'
    # set variables
    set -l env
    set -l filter
    set -g identity "$HOME/.ssh/id_rsa"
    set -l index
    set -l instances
    set -l list_all 0
    set -l match
    set -g ssh_options -o ConnectTimeout=3 -o StrictHostKeyChecking=no
    set -g user

    # parse arguments
    if [ (count $argv) -eq 0 ]
        set list_all 1
    else
        for i in (seq 1 (count $argv))
            switch $argv[$i]
                case '-f'
                    set filter $argv[(math $i + 1)]
                case '-x'
                    set index $argv[(math $i + 1)]
            end
        end
        echo
    end

    # set filter the same as env
    if [ -z "$filter" -a -n "$env" ]
        set filter $env
    end

    # list/filter instances and connect if only one match
    set instances (aws ec2 describe-instances --region eu-west-1 \
        --filters "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,ImageId,LaunchTime,InstanceType,KeyName,Tags[?Key==`Name`].Value[]|[0]]' \
        --output text | sort -k6 )
    for ins in $instances
        test $list_all -eq 1
        and echo $ins
        if [ (string match -ir $filter $ins) ]
            set match $match $ins
        end
    end
    test $list_all -eq 1
    and echo total: (count $instances)

    set -l count (count $match)
    switch $count
        case '0'
            test $list_all
            or echo "no match"
        case '1'
            echo $match
            connect $match
        case '*'
            echo >/tmp/ec2_instances
            for m in $match
                echo $m >>/tmp/ec2_instances
            end
            column -t /tmp/ec2_instances
            if [ $index ]
                connect $match[$index]
            end
    end
end

function connect -d "ssh connect to instance"
    set -l match $argv[1]
    set -l host (echo $match | awk '{print $1}')
    set -l instance_id (echo $match | awk '{print $2}')
    set -l image_id (echo $match | awk '{print $3}')
    set -g identity $HOME/.ssh/(echo $match | awk '{print $6}').pem
    set -g ssh_options $ssh_options -i $identity
    set_user $image_id
    if [ $status = 0 ]
        echo -e "\n################################################################################\n"
        echo -e "\nconnecting to $host as $user\n"
        echo -e "\n################################################################################\n"
        # echo $ssh_options
        ssh $ssh_options -l $user $host
    end
end

function set_user -d "description"
    set -l image_id $argv[1]
    set -l image_name (aws ec2 describe-images --image-id $image_id --query 'Images[0].Name' --output text)
    switch $image_name
        case '*ecs*'
            set -g user ec2-user
        case '*'
            set -g user centos
    end
end
