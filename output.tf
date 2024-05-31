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