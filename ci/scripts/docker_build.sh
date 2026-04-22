#!/usr/bin/env bash
set -euo pipefail

docker build -t devsecops-backend:local ./app/backend
