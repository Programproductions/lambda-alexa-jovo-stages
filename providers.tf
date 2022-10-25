terraform {


  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

  default_tags {
    tags = {
      Provisioned-By   = "Pete"
      Template-Creator = "www.program-productions.com"
      Environment      = var.environment
      Terraform        = true
    }
  }

}



# Ensure AWS Provider is in correct region
provider "aws" {
  alias      = "us_provider"
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key

}

provider "aws" {
  alias      = "uk_provider"
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key

}

# Configure the bucket region
provider "aws" {
  alias      = "ap_provider"
  region     = "ap-southeast-2"
  access_key = var.access_key
  secret_key = var.secret_key

}
