#!/bin/bash

## Simulated hash per deployment, normally used by CI/CD system
# HASH=$(openssl rand -hex 12)

# cd infra

## Initialize Terraform
terraform init

## Generate Terraform plan file
terraform plan

## Provision resources
terraform apply -auto-approve

## Read ECR repository URL to push Docker image with app to registry
REPOSITORY_URL=$(terraform output -raw app_repo_url)
REPOSITORY_BASE_URL=$(sed -r 's#([^/])/[^/].*#\1#' <<< ${REPOSITORY_URL})
aws ecr get-login-password | \
    docker login --username AWS --password-stdin ${REPOSITORY_BASE_URL}

## Build Docker image and tag new versions for every deployment
docker build -t abayomiganiy/kufuli:latest
docker tag abayomiganiy/kufuli:latest ${REPOSITORY_URL}:latest
docker push ${REPOSITORY_URL}:latest
