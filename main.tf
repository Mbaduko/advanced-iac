# Network: VPC, subnet, internet gateway and routing
module "network" {
  source = "./modules/network"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
}

# Server: EC2 instance with its key pair and security group
module "server" {
  source = "./modules/server"

  vpc_id       = module.network.main_vpc_id
  subnet_id    = module.network.main_subnet_id
  ssh_cidr     = var.ssh_cidr
  project_name = var.project_name
}

resource "local_file" "server_ip" {
  filename = "./ansible/inventory/inventory.ini"
  content  = <<-EOT
  [servers]
    server1 ansible_host="${module.server.server_public_ip}" ansible_user="${module.server.ssh_user}" ansible_ssh_private_key_file="${module.server.server_key_path}"
  EOT
}