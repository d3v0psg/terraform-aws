provider "aws" {
        region = "eu-west-2"
        access_key = "AKIAY7QP2P3ICK3TLAW2"
        secret_key = "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"
}

resource "aws_vpc" "developement-vpc" {
        cidr_block = "10.0.0.0/16"
	tags = {
		Name = "developement-vpc"
		}
}

resource "aws_subnet" "dev-subnet-1" {
        cidr_block = "10.0.10.0/24"
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
