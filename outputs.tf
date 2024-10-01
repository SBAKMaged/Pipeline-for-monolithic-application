output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_ec2_instance_id" {
  value = module.ec2_public.instance_id
}

output "private_ec2_instance_id" {
  value = module.ec2_private.instance_id
}

output "elb_dns_name" {
  value = module.elb.elb_dns_name
}