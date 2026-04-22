#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-devsecops-backend:local}"
trivy image --severity HIGH,CRITICAL "$IMAGE_NAME"
