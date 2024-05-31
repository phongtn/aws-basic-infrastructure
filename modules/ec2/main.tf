resource "aws_security_group" "allow_ssh" {
  vpc_id = var.vpc-id
  name = "allow_ssh_from_aywhere"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key" {
  key_name   = "ssh-key"
  public_key = file("~/.ssh/ec2_rsa.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu*"]
  }
}

resource "aws_instance" "instance_public" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet-public-id
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh.id]
  lifecycle {
    ignore_changes = [security_groups, tags, user_data]
  }
  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "instance_private" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet-private-id
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh.id]
  lifecycle {
    ignore_changes = [security_groups, tags, user_data]
  }
  tags = {
    Name = "private-instance"
  }
}