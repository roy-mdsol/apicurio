# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "roy_apicurio_vpc" {
  cidr_block = "192.168.0.0/16"

  #Shared
  instance_tenancy = "default"

  #Required by EKS
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "roy_apicurio"
    Project = "apicurio"
    Owner   = "roy"
  }
}

output "roy_vpc_id" {
  value       = aws_vpc.roy_apicurio_vpc.id
  description = "VPC Id"

  # not a secret information
  sensitive = false
}