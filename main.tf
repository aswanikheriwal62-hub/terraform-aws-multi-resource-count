terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
  project = "march-1"
}

#Make multi resource using count function

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${local.project}-vpc"
    } 
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 3
    tags = {
      Name = "${local.project}-subnet-${count.index}"
    }

}
 
# Since count = 3 creates three subnet instances, aws_subnet.main becomes a list and [0] is used to access the ID of the first subnet.
output "aws_subnet_id_0" {
  value = aws_subnet.main[0].id
  
}

output "aws_subnet_id_1" {
  value = aws_subnet.main[1].id
  
}

output "aws_subnet_id_2" {
  value = aws_subnet.main[2].id
  
}
