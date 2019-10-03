variable "workspace_to_region_map" {
  type = "map"

  default = {
      dev       = "eu-west-1"         # Ireland
      qa        = "eu-west-2"         # London
      staging   = "us-west-1"         # N. Virginia 
      prod      = "ap-southeast-2"    # sydney
  }
}
