terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cluster_creator, aws.iam_creator]
    }
  }
}
