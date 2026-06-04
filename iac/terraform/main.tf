# 1. TERRAFORM RUNTIME PROVIDER CONFIGURATION
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. LOCAL ENVIRONMENT ROUTING MATRIX (FLOCI REDIRECTION)
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_dev_key"
  secret_key                  = "mock_dev_secret"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Force standard Amazon API endpoints to target our internal workspace engine
  endpoints {
    ecr = "http://localhost:4566"
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}


# 3. DECLARATIVE PRIVATE CONTAINER REGISTRIES (ECR)


# Frontend ECR Space
resource "aws_ecr_repository" "aerovibe_ui" {
  name                 = "aerovibe-frontend-suite"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true # Hardened security scan simulation on image check-in
  }

  tags = {
    DeploymentContext = "AeroVibe-Local-Sandbox"
    ManagedBy         = "Terraform"
  }
}

# Backend REST Engine ECR Space
resource "aws_ecr_repository" "aerovibe_api" {
  name                 = "aerovibe-backend-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    DeploymentContext = "AeroVibe-Local-Sandbox"
    ManagedBy         = "Terraform"
  }
}


# 4. BLUEPRINT PIPELINE SERVICE OUTPUT MATRIX
 
output "aerovibe_frontend_registry_url" {
  value       = aws_ecr_repository.aerovibe_ui.repository_url
  description = "The target private ECR network endpoint string for the frontend container"
}

output "aerovibe_backend_registry_url" {
  value       = aws_ecr_repository.aerovibe_api.repository_url
  description = "The target private ECR network endpoint string for the backend container"
}