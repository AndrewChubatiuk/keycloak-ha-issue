#!/bin/sh

set -eo pipefail

terraform init
terraform apply -auto-approve

