module "network" {
  source = "./modules/network"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
}

module "server" {
    source = "./modules/server"

    vpc_id       = module.network.main_vpc_id
    subnet_id = module.network.main_subnet_id
    ssh_cidr = var.ssh_cidr
    project_name = var.project_name
}