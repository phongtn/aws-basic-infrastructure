output "ec2_instances" {
  value = {
    instance_public_publicDNS = aws_instance.instance_public.public_dns
    instance_public_privateIp = aws_instance.instance_public.private_ip
    instance_private_publicDNS = aws_instance.instance_private.public_dns
    instance_private_privateIp = aws_instance.instance_private.private_ip
  }
}