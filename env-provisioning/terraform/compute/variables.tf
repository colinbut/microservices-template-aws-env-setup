variable "region" {
  default     = "eu-west-1"
  description = "The region to execute Terraform on"
}

variable "ec2_instance_type" {
  //default = "t2.micro"
  type = "string"
}

variable "region_to_ami_map" {
  type = "map"

  default = {
      eu-west-1         = "ami-0bbc25e23a7640b9b"
      eu-west-2         = "ami-0d8e27447ec2c8410"
      us-west-1         = "ami-056ee704806822732"
      ap-southeast-2    = "ami-0dc96254d5535925f"
  }
}

variable "region_to_keypair_map" {
    type = "map"

    default = {
      eu-west-1         = "MyIrelandKP"
      eu-west-2         = "MyLondonKP"
      us-west-1         = "MyKPWebServer"
      ap-southeast-2    = "MySydneyKP"
    }
}