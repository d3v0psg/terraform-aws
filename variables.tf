variable "vpc_cidr_block" {
	default = "10.0.0.0/16"
	description = "VPC CIDR Block"
}

variable "subnet_cidr_block" {
	default = "10.0.10.0/24"
	description = "Subnet CIDR Block"
}
