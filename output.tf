output "vpc-id" {
  value = aws_vpc.main.id
}

output "vpc-name" {
  value = aws_vpc.main.tags.Name
}

output "public-subnet" {
  value = aws_subnet.public_subnets[*].id
}

output "private-subnet" {
  value = aws_subnet.private_subnets[*].id
}

output "ec2_instances_PUBLIC" {
  value = {
    publicIP = module.ec2.public_pub_ip
    privateIP = module.ec2.public_private_ip
  }
}

output "ec2_instances_PRIVATE" {
  value = {    
    publicDNS = module.ec2.private_pub_ip
    privateIP = module.ec2.private_private_ip
  }
}