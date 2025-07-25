output "aws_instance_ids" {
  value = aws_instance.ukol4[*].id
  description = "IDs of EC2 instances"
}

output "public_ips" {
  value = aws_instance.ukol4[*].public_ip
  description = "Public IPs of EC2 instances"
}
