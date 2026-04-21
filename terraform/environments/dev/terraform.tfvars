aws_region = "us-east-1"
name       = "aws-devsecops-appsec-v1"

vpc_cidr = "10.10.0.0/16"

azs = [
"us-east-1a",
"us-east-1b"
]

public_subnet_cidrs = [
"10.10.1.0/24",
"10.10.2.0/24"
]

private_app_cidrs = [
"10.10.11.0/24",
"10.10.12.0/24"
]
