variable "aws_region" {
  default = "sa-east-1"
}

variable "cluster_vpc" {
  default = "vpc-66cfb701"
}

variable "cluster_name" {
  default = "meu-eks-demo-terraform"
}

variable "k8s_version" {
  default = "1.21"
}

variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

#Adicionei a partir daqui
variable "team_name" {
  default = "america"
}

variable "enabled_cluster_log_types" {
  type = list(string)
  default = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]
}

#Mudei essa, tirei o tipo e setei o default
variable "public_access_cidrs" {
  type = list(string)
  default = [
    "0.0.0.0/0",
  ]
}

variable "role_arn" {
  default = "arn:aws:iam::028473989100:role/EKS-role"
}

variable "subnet_ids" {
  type = list(string)
  default = [
    "subnet-5ce01307",
    "subnet-6f25e726",
    "subnet-ab18edcd",
  ]
}

#nodegroup
variable "node_group_arn" {
  default = "arn:aws:iam::028473989100:role/eks-worker-node"
}

variable "node_group_desired_size" {
  type    = number
  default = 2
}

variable "node_group_max_size" {
  type    = number
  default = 2
}

variable "node_group_min_size" {
  type    = number
  default = 2
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "disk_size" {
  type    = number
  default = 50
}

variable "node_group_prefix" {
  type        = string
  default     = "docaraio"
  description = "All node groups are appended with a 26 UTC timestamp. Node groups names can only be 63 chars long."

  validation {
    condition     = length(var.node_group_prefix) <= 37
    error_message = "Variable node_group_prefix must be less than or equal to 37 chars."
  }
}

variable "node_group_taint" {
  type    = list(any)
  default = []
}

variable "labels" {
  type    = map(any)
  default = {}
}

variable "update_max_unavailable_percentage" {
  type    = number
  default = 25
}

variable "force_update_version" {
  type    = bool
  default = true
}
