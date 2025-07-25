data "aws_ami" "linux_test_AWS" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "SSH_ec2_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
  
}

resource "aws_security_group" "Security_Group" {
  name        = "${var.prefix}-${var.environment}-sg"
  description = "Security group for EC2 instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
}

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "povilit vsechen provoz"
  }

  tags = {
    Name        = "${var.prefix}-${var.environment}-ec2"
    Environment = var.environment
    Kurz        = var.kurz
  } 
}


resource "aws_instance" "ukol4" {
  count         = var.instance_count
  ami           = data.aws_ami.linux_test_AWS.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.SSH_ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.Security_Group.id]

  tags = {
    Name        = "${var.prefix}-${var.environment}-ec2-${count.index + 1}"
    Environment = var.environment
    Kurz        = var.kurz
  }
  

user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<html><body><h1>Terraform EC2 Instance ${count.index}</h1><p>Hurá funguje ukol pro ${var.kurz} hotov</p></body></html>" > /var/www/html/index.html
  EOF
}
