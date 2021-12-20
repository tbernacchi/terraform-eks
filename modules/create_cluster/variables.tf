variable "cluster_vpc" {
  default = "vpc-66cfb701"
}

variable "aws_region" {
  default = "sa-east-1"
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
