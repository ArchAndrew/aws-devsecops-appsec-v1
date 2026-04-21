variable "name" {
description = "Base name used for VPC resources"
type        = string
}

variable "vpc_cidr" {
description = "CIDR block for the VPC"
type        = string
}

variable "azs" {
description = "Availability zones to use"
type        = list(string)
}

variable "public_subnet_cidrs" {
description = "CIDRs for public subnets"
type        = list(string)
}

variable "private_app_cidrs" {
description = "CIDRs for private application subnets"
type        = list(string)
}

variable "tags" {
description = "Common tags"
type        = map(string)
default     = {}
}
