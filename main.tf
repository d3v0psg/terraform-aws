resource "aws_vpc" "developement-vpc" {
        cidr_block = var.vpc_cidr_block
	tags = {
		Name = "developement-vpc"
		}
}

resource "aws_subnet" "dev-subnet-1" {
        cidr_block = var.subnet_cidr_block
        vpc_id = aws_vpc.developement-vpc.id
        availability_zone = "eu-west-2a"
        tags = {
                Name = "dev-subnet-1"
                }

}

data "aws_vpc" "existing_vpc" {
    default = true
}

resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone="eu-west-2b"
        tags = {
                Name = "dev-subnet-2"
                }

}
output "VPC-ARN" {
	value = aws_vpc.developement-vpc.arn
}
output "Subnet-ARN" {
        value = aws_subnet.dev-subnet-1.arn
}

