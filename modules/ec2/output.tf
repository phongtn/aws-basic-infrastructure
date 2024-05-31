output "public_pub_ip" {
  value =  aws_instance.instance_public.public_ip    
}

output "public_private_ip" {
  value =  aws_instance.instance_public.private_ip    
}

output "private_pub_ip" {
  value =  aws_instance.instance_private.public_ip    
}

output "private_private_ip" {
  value =  aws_instance.instance_private.private_ip    
}