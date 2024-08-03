terraform {
  backend "s3" {
    bucket = "wabsense-terraform-bucket"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
