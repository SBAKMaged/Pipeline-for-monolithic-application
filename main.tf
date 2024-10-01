provider "aws" {
  region                  = "us-east-1" 
  access_key              = "dummy"
  secret_key              = "dummy"
  skip_credentials_validation = true
  skip_requesting_account_id = true
}


module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
}

module "security_groups" {
  source               = "./modules/security_groups"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidr   = var.public_subnet_cidr
}

module "ec2_public" {
  source               = "./modules/ec2"
  instance_name        = "Public-EC2"
  subnet_id            = module.vpc.public_subnet_id
  security_group_ids   = [module.security_groups.public_sg_id]
  key_name             = var.key_name
  ami_id               = var.ami_id
  user_data            = var.public_instance_user_data
}

module "ec2_private" {
  source               = "./modules/ec2"
  instance_name        = "Private-EC2"
  subnet_id            = module.vpc.private_subnet_id
  security_group_ids   = [module.security_groups.private_sg_id]
  key_name             = var.key_name
  ami_id               = var.ami_id
  user_data            = var.private_instance_user_data
}

module "elb" {
  source               = "./modules/elb"
  subnets              = [module.vpc.public_subnet_id]
  security_group_id    = module.security_groups.elb_sg_id
}

module "autoscaling" {
  source                      = "./modules/autoscaling"
  launch_configuration_name   = "MyLaunchConfig"
  key_name                    = var.key_name
  security_group_ids          = [module.security_groups.public_sg_id]
  elb_name                    = module.elb.elb_name
  subnet_ids                  = [module.vpc.public_subnet_id]
  desired_capacity            = var.desired_capacity
  min_size                    = var.min_size
  max_size                    = var.max_size
  ami_id                      = var.ami_id
  user_data                   = var.user_data 

}