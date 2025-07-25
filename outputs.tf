output "instance_ids" {
  value = module.my_ec2_module.aws_instance_ids
  description = "IDs of created EC2 instances"
}
output "instance_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.my_ec2_module.public_ips
}
