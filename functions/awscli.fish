function awscli -d "notes for awscli commands"
echo '

# latest ubuntu 16.04 ami
aws ec2 describe-images --owners "099720109477" --filters Name="root-device-type",Values="ebs" \
      Name=architecture,Values=x86_64 Name=name,Values="ubuntu/images/hvm-ssd/ubuntu-xenial-16.04*" \
      --query "sort_by(Images, &CreationDate)[-3:].[ImageId, CreationDate, Name]" --output=text

aws ec2 describe-images --owners "099720109477" --filters Name="root-device-type",Values="ebs" \
      Name=architecture,Values=x86_64 Name=name,Values="ubuntu/images/hvm-ssd/ubuntu-xenial-16.04*" \
      --query "sort_by(Images, &CreationDate)[-1].ImageId" --output=text

# latest centos 7 ami
aws ec2 describe-images --filter Name="name",Values="CentOS Linux 7 x86_64 HVM EBS*" Name="product-code",Values="aw0evgkw8e5c1q413zgy5pjce" \
    --query "sort_by(Images, &CreationDate)[].[ImageId, CreationDate, Name]" --output text

aws ec2 describe-images --filter Name="name",Values="CentOS Linux 7 x86_64 HVM EBS*" Name="product-code",Values="aw0evgkw8e5c1q413zgy5pjce" \
    --query "sort_by(Images, &CreationDate)[-1].ImageId" --output text

# latest amazon ecs-optimized ami
aws ec2 describe-images --owners "amazon" --filter Name="name",Values="*amazon-ecs-optimized" \
    --query "sort_by(Images, &CreationDate)[-3:].[ImageId, CreationDate, Name]" --output text

aws ec2 describe-images --owners "amazon" --filter Name="name",Values="*amazon-ecs-optimized" \
    --query "sort_by(Images, &CreationDate)[-1].ImageId" --output text

'
end
