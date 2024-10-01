variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  default     = "us-east-1a"
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI ID in us-east-1
}

variable "public_instance_user_data" {
  description = "User data script for public EC2 instance"
  default     = ""
}

variable "private_instance_user_data" {
  description = "User data script for private EC2 instance"
  default     = ""
}

variable "autoscaling_user_data" {
  description = "User data script for Auto Scaling instances"
  default     = ""
}

variable "desired_capacity" {
  description = "Desired capacity for Auto Scaling group"
  default     = 2
}

variable "min_size" {
  description = "Minimum size of Auto Scaling group"
  default     = 1
}

variable "max_size" {
  description = "Maximum size of Auto Scaling group"
  default     = 3
}

variable "user_data" {
  description = "User data to configure the instance"
  type        = string
  default     = ""  
}