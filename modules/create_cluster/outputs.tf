output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "vpc_config" {
  value = aws_eks_cluster.cluster.vpc_config
}

output "identity" {
  value = aws_eks_cluster.cluster.identity
}

output "tags" {
  value = aws_eks_cluster.cluster.tags_all
}
