terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"
# }

provider "aws" {
  region                  = "us-east-1"
  access_key              = "mock_access_key"
  secret_key              = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true  # for localstack
  endpoints {
    ec2       = "http://localhost:4566"
    s3        = "http://localhost:4566"
    dynamodb  = "http://localhost:4566"
    lambda    = "http://localhost:4566"
    kinesis   = "http://localhost:4566"
    # Add other services endpoints as needed
  }
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}
