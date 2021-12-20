locals {
  node_group_prefix = coalesce(var.node_group_prefix, var.cluster_name)

  node_group_name = split(":", aws_eks_node_group.node_group.id)[1]

  tags = {
    Name                                            = var.node_group_prefix,
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned",
    "k8s.io/cluster-autoscaler/enabled"             = "true",
    "kubernetes.io/cluster/${var.cluster_name}"     = "owned"
    region                                          = var.aws_region
    cloud                                           = "aws"
    owner                                           = var.team_name
    role                                            = "eks-node"
  }
}
