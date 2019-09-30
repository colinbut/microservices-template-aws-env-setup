variable "configuration-name" {
  default = "MicroserviceTemplate"
}

variable "region" {
  default = "eu-west-1"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}


variable "us-east-1_AMI" {
  default = "ami-0b898040803850657"
}

variable "us-west-1_AMI" {
  default = "ami-056ee704806822732"
}

variable "eu-west-1_AMI" {
  default = "ami-0bbc25e23a7640b9b"
}

variable "eu-west-2_AMI" {
  default = "ami-0d8e27447ec2c8410"
}

variable "ap-southeast-2_AMI" {
  default = "ami-0dc96254d5535925f"
}