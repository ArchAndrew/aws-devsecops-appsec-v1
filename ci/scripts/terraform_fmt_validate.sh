#!/usr/bin/env bash
set -euo pipefail

cd terraform/environments/dev
terraform fmt -recursive
terraform init
terraform validate
terraform plan
