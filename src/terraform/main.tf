data "terraform_remote_state" "us-east-2-global" {
  backend = "local"
  config = {
    path = ".terraform/terraform.tfstate"
  }
}
