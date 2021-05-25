terraform {
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}
provider "aws" {
    profile = "default"
    region  = "${var.aws_region}"
}
