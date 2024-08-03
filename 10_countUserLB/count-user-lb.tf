provider "aws" {
  region = "us-east-1"
}

variable "elb_names" {
  type = list
  default = [ "dev-loadbalancer", "stage-loadebalancer", "prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
}