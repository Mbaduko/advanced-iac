data "aws_ssm_parameter" "amazon_linux" {
    name="/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "tls_private_key" "main" {
  algorithm = "ED25519"
}


resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-server-key"
  public_key = tls_private_key.main.public_key_openssh

  tags = {
    Name        = "${var.project_name}-keypair"
    Environment = var.environment
  }
}

resource "local_sensitive_file" "private_key" {
    content = tls_private_key.main.private_key_pem
    filename = "${var.key_path}"
    file_permission = "0400"
}

resource "aws_security_group" "main" {
  name        = "${var.project_name}-sg"
  description = "Security group for ${var.project_name} EC2 instance"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "main_ssh" {
    security_group_id  = aws_security_group.main.id

    ip_protocol = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_ipv4 = var.ssh_cidr
}

resource "aws_vpc_security_group_ingress_rule" "main_http" {
    security_group_id  = aws_security_group.main.id

    ip_protocol = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_ipv4 = var.http_cidr
}

resource "aws_instance" "main" {
  ami = data.aws_ssm_parameter.amazon_linux.value
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name        = "${var.project_name}-ec2"
    Environment = var.environment
  }
}