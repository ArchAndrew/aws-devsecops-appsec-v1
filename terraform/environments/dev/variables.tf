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
