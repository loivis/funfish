function ec2metadata -d "fetch ec2 metadata with awscli"
echo '
    region=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname | cut -d. -f2)
    export AWS_DEFAULT_REGION=$region

    ami_id=$(curl -s http://169.254.169.254/latest/meta-data/ami-id)
    local_hostname=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
    instance_profile_arn=$(curl -s http://169.254.169.254/latest/meta-data/iam/info | jq -r ".InstanceProfileArn")
    instance_profile_name=$(curl -s http://169.254.169.254/latest/meta-data/iam/info | jq -r ".InstanceProfileArn" | cut -d"/" -f2)
    instance_profile_id=$(curl -s http://169.254.169.254/latest/meta-data/iam/info | jq -r ".InstanceProfileId")
    instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
    instance_type=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
    ipv4=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
    mac_address=$(curl -s http://169.254.169.254/latest/meta-data/mac)
    availability_zone=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
    public_keys=$(curl -s http://169.254.169.254/latest/meta-data/public-keys/ | cut -d"=" -f2)
    reservation_id=$(curl -s http://169.254.169.254/latest/meta-data/reservation-id)
    security_groups=$(curl -s http://169.254.169.254/latest/meta-data/security-groups | tr "\n" ",")
    user_data=$(curl -s http://169.254.169.254/latest/user-data)
    instance_name=$(aws ec2 describe-tags --filters Name=resource-id,Values=$instance_id Name=key,Values=Name \
        --query "Tags[].Value" --output text)
    export instance_name instance_id ipv4 region availability_zone instance_type ami_id public_keys security_groups reservation_id local_hostname mac_address instance_profile_arn instance_profile_name instance_profile_id

    echo "
    region: $region
    instance_id: $instance_id
    instance_name: $instance_name
    ipv4: $ipv4
    availability_zone: $availability_zone
    instance_type: $instance_type
    ami_id: $ami_id
    public_keys: $public_keys
    security_groups: $security_groups
    reservation_id: $reservation_id
    local_hostname: $local_hostname
    mac_address: $mac_address
    instance_profile_arn: $instance_profile_arn
    instance_profile_name: $instance_profile_name
    instance_profile_id: $instance_profile_id
    " | column -t
'
end
