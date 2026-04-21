variable "name" {
description = "Base name for EKS resources"
type        = string
}

variable "kubernetes_version" {
description = "EKS Kubernetes version"
type        = string
}

variable "subnet_ids" {
description = "Subnet IDs for the EKS cluster"
type        = list(string)
}

variable "node_group_subnet_ids" {
description = "Subnet IDs for the managed node group"
type        = list(string)
}

variable "vpc_id" {
description = "VPC ID"
type        = string
}

variable "desired_size" {
description = "Desired node count"
type        = number
default     = 2
}

variable "min_size" {
description = "Minimum node count"
type        = number
default     = 1
}

variable "max_size" {
description = "Maximum node count"
type        = number
default     = 2
}

variable "instance_types" {
description = "Node group instance types"
type        = list(string)
default     = ["t3.medium"]
}

variable "tags" {
description = "Common tags"
type        = map(string)
default     = {}
}