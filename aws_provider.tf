provider "aws" {
  access_key = "AKIAJCARDWKDMEMTXBZQ"
  secret_key = "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"
  region = "us-east-2"
  }

resource "aws_vpc" "vpc_tuto" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "tf VPC"
  }
}

resource "aws_subnet" "tf_subnet" {
  vpc_id                  = "${aws_vpc.vpc_tuto.id}"
  map_public_ip_on_launch = true
  cidr_block              = "172.31.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
  	Name =  "subnet tf"
  }
}

resource "aws_internet_gateway" "ln-gw" {
  vpc_id = "${aws_vpc.vpc_tuto.id}"
  tags {
        Name = "InternetGateway"
    }
}

resource "aws_route" "ln_access" {
  route_table_id         = "${aws_vpc.vpc_tuto.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ln-gw.id}"
}

resource "aws_security_group" "ln_sg" {
vpc_id = "${aws_vpc.vpc_tuto.id}"
tags = {
  	Name =  "my_ln_sg"
  }
}


