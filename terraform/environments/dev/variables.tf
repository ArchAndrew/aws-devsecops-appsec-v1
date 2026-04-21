variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "name" {
  type        = string
  description = "Base project name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_app_cidrs" {
  type        = list(string)
  description = "Private app subnet CIDRs"
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version"
}

variable "node_instance_types" {
  type        = list(string)
  description = "EKS node group instance types"
}

variable "desired_size" {
  type        = number
  description = "Desired node count"
}

variable "min_size" {
  type        = number
  description = "Minimum node count"
}

variable "max_size" {
  type        = number
  description = "Maximum node count"
}