resource "aws_vpc" "VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
      Name = "${var.configuration-name}-VPC"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.VPC.id}"
  tags = {
      Name = "${var.configuration-name}-IGW"
  }
}

resource "aws_subnet" "public-subnet-A" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.configuration-name}-public-subnet-A"
  }
}

resource "aws_route_table" "public-route-table-A" {
  vpc_id = "${aws_vpc.VPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }

  tags = {
    Name = "${var.configuration-name}-PublicRouteTableA"
  }
}

resource "aws_route_table_association" "public-route-table-association-A" {
  subnet_id = "${aws_subnet.public-subnet-A.id}"
  route_table_id = "${aws_route_table.public-route-table-A.id}"
}

resource "aws_security_group" "LBSG" {
  name = "LBSG"  
  description = "Allow Http access and SSH"
  vpc_id = "${aws_vpc.VPC.id}"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "WebDMZ" {
  name = "WebDMZ"
  description = "Allow Backend Server access and SSH"
  vpc_id = "${aws_vpc.VPC.id}"

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "MicroservicesTemplateLB" {
  ami = "${var.eu-west-1_AMI}"
  instance_type = "${var.ec2_instance_type}"
  subnet_id = "${aws_subnet.public-subnet-A.id}"
  vpc_security_group_ids = ["${aws_security_group.LBSG.id}"]
  associate_public_ip_address = true
  tags = {
      Name = "${var.configuration-name}LB"
  }
}

resource "aws_instance" "MicroservicesTemplateWeb01" {
  ami = "${var.eu-west-1_AMI}"
  instance_type = "${var.ec2_instance_type}"
  subnet_id = "${aws_subnet.public-subnet-A.id}"
  vpc_security_group_ids = ["${aws_security_group.WebDMZ.id}"]
  associate_public_ip_address = true
  tags = {
      Name = "${var.configuration-name}Web01"
  }
}
