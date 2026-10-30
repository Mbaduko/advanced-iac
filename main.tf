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