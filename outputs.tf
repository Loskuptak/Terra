output "instance_ids" {
  value = module.my_ec2_module.aws_instance_ids
  description = "IDs of created EC2 instances"
}
