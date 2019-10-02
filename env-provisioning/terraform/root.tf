terraform {
    backend "s3" {
        bucket = "terraform-state-colin-s3"
        key = "path_to_my_key"
        region = "us-east-1"
    }
    required_version = ">= 0.12.4"
}


locals {
  region = "${lookup(var.workspace_to_region_map, terraform.workspace, "eu-west-1")}"
}


provider "aws" {
  region = "${local.region}"
}
