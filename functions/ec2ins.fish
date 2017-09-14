function ec2ins -d 'list ec2 instances and connect if there is only one'
    # set variables
    set -l env
    set -l filter
    set -l identity "$HOME/.ssh/id_rsa"
    set -l index
    set -l instances
    set -l list_all 0
    set -l match
    set -l ssh_options -o ConnectTimeout=3 -o StrictHostKeyChecking=no
    set -l users centos ec2-user

    # parse arguments
    if [ (count $argv) -eq 0 ]
        set list_all 1
    else
        for i in (seq 1 (count $argv))
            switch $argv[$i]
                case '-i'
                    string match -r '^(prod|stage|test|central)$' $argv[(math $i + 1)] 1>/dev/null
                    if [ $status -eq 0 ]
                        set env $argv[(math $i + 1)]
                        set identity "$HOME/.ssh/$env.pem"
                    else
                        set identity $argv[(math $i + 1)]
                    end
                case '-f'
                    set filter $argv[(math $i + 1)]
                case '-u'
                    set users $argv[(math $i + 1)]
                case '-x'
                    set index $argv[(math $i + 1)]
            end
        end
        set ssh_options $ssh_options -i $identity
        echo ssh_options: $ssh_options
        echo
    end

    # set filter the same as env
    if [ -z "$filter" -a -n "$env" ]
        set filter $env
    end

    # list/filter instances and connect if only one match
    set instances (aws ec2 describe-instances --region eu-west-1 \
        --filters "Name=instance-state-name,Values=running" \
        --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]|[0]]' \
        --output text | sort -k3 )
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
            set -l host (echo $match | awk '{print $1}')
            for user in $users
                ssh $ssh_options $user@$host 'exit' 2>/dev/null
                if [ $status = 0 ]
                    echo -e "\n################################################################################\n"
                    echo -e "connecting to $host as $user"
                    echo -e "\n################################################################################\n"
                    ssh $ssh_options $user@$host
                end
            end
        case '*'
            # echo "match: ≥1"
            for m in $match
                echo $m
            end
            if [ $index ]
                set -l host (echo $match[$index] | awk '{print $1}')
                for user in $users
                    # echo $user $host
                    ssh $ssh_options $user@$host 'exit' 2>/dev/null
                    # echo $status
                    if [ $status = 0 ]
                        echo -e "\n################################################################################\n"
                        echo -e "\nconnecting to $host as $user\n"
                        echo -e "\n################################################################################\n"
                        ssh $ssh_options $user@$host
                    end
                end
            end
    end

end
