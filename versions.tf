terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Or specify the version you want
    }
  }
}

provider "aws" {
  region = "us-east-1" # Or your desired region
}