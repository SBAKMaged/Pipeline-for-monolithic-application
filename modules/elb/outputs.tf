output "elb_name" {
  value = aws_elb.this.name
}

output "elb_dns_name" {
  value = aws_elb.this.dns_name
}
