terraform {
  required_providers {
    aws = {
      version = "4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "akedzierski-terraform-state-bucket"
    key    = "env/sandbox/terraform.tfstate"
    # key    = "env/production/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}