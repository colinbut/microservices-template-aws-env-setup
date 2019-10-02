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

variable "region_to_ami_map" {
  type = "map"

  default = {
      eu-west-1 = "ami-0bbc25e23a7640b9b"
      eu-west-2 = "ami-0d8e27447ec2c8410"
      us-west-1 = "ami-056ee704806822732"
      ap-southeast-2 = "ami-0dc96254d5535925f"
  }
}

variable "workspace_to_region_map" {
  type = "map"

  default = {
      dev = "eu-west-1"         # Ireland
      qa = "eu-west-2"          # London
      staging = "us-west-1"     # N. Virginia 
      prod = "ap-southeast-2"   # sydney
  }
}

# assumes existing keypairs
variable "region_to_keypair_map" {
    type = "map"

    default = {
      eu-west-1 = "MyIrelandKP"
      eu-west-2 = "MyLondonKP"
      us-west-1 = "MyKPWebServer"
      ap-southeast-2 = "MySydneyKP"
    }
}
