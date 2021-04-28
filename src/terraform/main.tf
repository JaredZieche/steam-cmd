provider "aws" {
    profile = "default"
    region  = "${var.aws_region}"
}

resource "aws_instance" "steam_cmd" {
  ami   = "${var.steam_cmd_ami_latest}"
  instance_type   = "${var.steam_cmd_instance_type}"
