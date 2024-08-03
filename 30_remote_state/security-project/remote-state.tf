data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "wabsense-terraform-bucket"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
