# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "roy_apicurio_igw" {
  vpc_id = aws_vpc.roy_apicurio_vpc.id

  tags = {
    Name    = "roy_apicurio"
    Project = "apicurio"
    Owner   = "roy"
  }
}

output "roy_gw_id" {
  value       = aws_internet_gateway.roy_apicurio_igw.id
  description = "Internet Gateway Id"

  # not a secret information
  sensitive = false
}