output "name" {
  # id is in form of $cluster_name:node_group_name. We split on seperator `:` and use the second element
  value = split(":", aws_eks_node_group.node_group.id)[1]
}
