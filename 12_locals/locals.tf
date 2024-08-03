provider "aws" {
  region = "us-east-1"
}

locals {
  environments = {
    dev = {
      instance_type = "t2.micro"
      ami           = "ami-0481e8ba7f486bd99" # Ubuntu 20.04 LTS
      key_pair_name = "dev-keypair"
    },
    prod = {
      instance_type = "t3.large"
      ami           = "ami-02b972fec07f1e659" # AMAZON LINUX 2 AMI
      key_pair_name = "prod-keypair"
    }
  }
}

resource "aws_instance" "example_instance" {
  for_each = local.environments

  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = each.value.key_pair_name

  tags = {
    Name        = "${each.key}-instance"
    Environment = each.key
  }
}
