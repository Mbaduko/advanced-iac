output "server_public_ip" {
  value = aws_instance.main.public_ip
}

output "server_dns_name" {
  value = aws_instance.main.public_dns
}

output "server_key_name" {
  value = aws_key_pair.main.key_name
}

output "server_key_path" {
  value = local_sensitive_file.private_key.filename
}

output "ssh_user" {
  value = "ec2-user"
}