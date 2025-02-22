# outputs.tf

output "vpc_id" {
  description = "A reference to the created VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_route_table_id" {
  description = "Public Routing"
  value       = aws_route_table.public_route_table.id
}

output "private_route_table_1_id" {
  description = "Private Routing AZ1"
  value       = aws_route_table.private_route_table_1.id
}


output "public_subnets" {
  description = "A list of the public subnets"
  value       = aws_subnet.public_subnet_1.id
}

output "private_subnets" {
  description = "A list of the private subnets"
  value       = aws_subnet.private_subnet_1.id
}

output "aws_instance" {
  description = "A list of the private subnets"
  value =aws_instance.fe_ec2.id
  
}


output "aws_security_group" {
  description = "web security group"
  value       = aws_security_group.web_sec_group.name
}




output "webserver_eip" {
  description = "webserver elastic ip"
  value       = aws_eip.webserver_eip.public_ip
}

output "webserver_pip" {
  description = "webserver private ip"
  value       = aws_instance.fe_ec2.private_ip
}


output "monitoring_server_eip" {
  description = "monitoring server elastic ip"
  value       = aws_eip.monitoring_server_eip.public_ip
}

output "monitoring_server_pip" {
  description = "monitoring server private ip"
  value = aws_instance.monitoring_server.private_ip
}

# Output the private key for local use (be careful with sensitive data)
output "ec2_private_key_pem" {
  description = "Private key in PEM format"
  value       = tls_private_key.rsa-4096-pem.private_key_pem
  sensitive   = true
}

# Base64 encode the private key for environment variable compatibility
output "ec2_private_key_base64" {
  value     = base64encode(tls_private_key.rsa-4096-pem.private_key_pem)
  sensitive = true
}

output "k3s_server_eip" {
  description = "k3s server elastic ip"
  value       = aws_eip.k3s_server_eip.public_ip
}

output "k3s_server_pip" {
  description = "k3s server private ip"
  value = aws_instance.k3s_ec2.private_ip
}