module "vpc" {
  source              = "../../modules/vpc"
  name                = var.name
  vpc_cidr            = var.vpc_cidr
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
  private_app_cidrs   = var.private_app_cidrs
  tags                = local.common_tags
}

module "eks" {
  source                = "../../modules/eks"
  name                  = var.name
  kubernetes_version    = var.kubernetes_version
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_app_subnet_ids
  node_group_subnet_ids = module.vpc.private_app_subnet_ids
  instance_types        = var.node_instance_types
  desired_size          = var.desired_size
  min_size              = var.min_size
  max_size              = var.max_size
  tags                  = local.common_tags
}