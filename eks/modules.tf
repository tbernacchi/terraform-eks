module "create_cluster" {
  source = "../modules/create_cluster"

  aws_region                = var.aws_region
  role_arn                  = var.role_arn
  cluster_name              = var.cluster_name
  cluster_vpc               = var.cluster_vpc
  public_access_cidrs       = var.public_access_cidrs
  subnet_ids                = var.subnet_ids
  enabled_cluster_log_types = var.enabled_cluster_log_types
}

module "create_nodegroup" {
  source = "../modules/create_nodegroup"

  depends_on = [
    module.create_cluster
  ]
}
