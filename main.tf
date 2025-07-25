terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket         = "terra-bucket-osv1"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "DB-terra"
    
  }
}

provider "aws" {
  region = var.region
}

module "my_ec2_module" {
  source          = "./modules/ec2"   # relative path to your module folder
  instance_type   = var.instance_type
  key_name        = var.key_name
  instance_count  = var.instance_count
  prefix          = var.prefix
  environment     = var.environment
  kurz            = var.kurz
  public_key_path = var.public_key_path
}
