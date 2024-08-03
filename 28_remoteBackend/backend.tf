terraform {
  backend "s3" {
    bucket = "wabsense-terraform-bucket"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
