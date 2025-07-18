output "ec2_public_ip" {
  value = aws_instance.server.public_ip
  description = "The public IP of the EC2 instance"
}

output "ec2_instance_id" {
  value = aws_instance.server.id
  description = "The ID of the EC2 instance"
}
