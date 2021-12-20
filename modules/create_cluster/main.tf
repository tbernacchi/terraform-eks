resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  version  = var.k8s_version 
  role_arn = var.role_arn

  vpc_config {
    endpoint_public_access  = true
    endpoint_private_access = true
    public_access_cidrs     = var.public_access_cidrs
    subnet_ids              = var.subnet_ids 
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types

  tags = {
    Name     = var.cluster_name
    region   = var.aws_region
    cloud    = "aws"
    owner    = var.team_name
  }
}
