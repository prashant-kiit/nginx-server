#!/bin/bash

echo "Cleaning build artifacts and Terraform state..."

rm -rf dist/ \
       node_modules/ \
       pnpm-lock.yaml \
       .terraform/ \
       .terraform.lock.hcl \
       terraform.tfstate \
       terraform.tfstate.backup

echo "Cleanup complete"