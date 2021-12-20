resource "aws_eks_node_group" "node_group" {

  cluster_name           = var.cluster_name
  node_group_name_prefix = "${local.node_group_prefix}-"
  node_role_arn          = var.node_group_arn
  subnet_ids             = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0]
    ]
    create_before_destroy = true
  }

  force_update_version = var.force_update_version

  update_config {
    max_unavailable_percentage = var.update_max_unavailable_percentage
  }

  dynamic "taint" {
    for_each = var.node_group_taint

    content {
      key    = taint.value.key
      effect = taint.value.effect
    }
  }

  labels = var.labels
  tags   = local.tags
}
