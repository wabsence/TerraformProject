provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

variable "istest" {
  default = true
}

resource "aws_key_pair" "instance_key_pair" {
  key_name   = var.istest ? "dev-keypair" : "prod-keypair"                                           # Replace with your desired key pair name
  public_key = file("C:\\Users\\USER\\Desktop\\ec2keys\\${var.istest ? "dev" : "prod"}-keypair.pub") # Replace with the path to your public key file
}

# resource "null_resource" "save_private_key" {
#   triggers = {
#     key_pair_fingerprint = aws_key_pair.instance_key_pair.fingerprint
#   }

#   provisioner "local-exec" {
#     command = <<-EOT
#       mkdir "$env:USERPROFILE\Desktop\keys" -ErrorAction SilentlyContinue
#       aws ec2 create-key-pair --key-name ${aws_key_pair.instance_key_pair.key_name} --query 'KeyMaterial' --output text | Out-File "$env:USERPROFILE\Desktop\keys\${aws_key_pair.instance_key_pair.key_name}.pem"
#     EOT
#   }
# }

resource "aws_instance" "dev_instance" {
  count         = var.istest ? 1 : 0      # If istest is true, create 1 instance, otherwise create 0 instances
  ami           = "ami-0481e8ba7f486bd99" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"              # Default instance type for dev environment

  #   key_name      = "dev-keypair"  # Replace with the key pair name for dev environment
  key_name = aws_key_pair.instance_key_pair.key_name

  tags = {
    Name        = "DevInstance"
    Environment = "Dev"
  }
}

resource "aws_instance" "prod_instance" {
  count         = var.istest ? 0 : 1      # If istest is true, create 0 instances, otherwise create 1 instance
  ami           = "ami-02b972fec07f1e659" # AMAZON LINUX 2 AMI
  instance_type = "t2.micro"              # Instance type for prod environment

  #   key_name      = "prod-keypair"  # Replace with the key pair name for prod environment
  key_name = aws_key_pair.instance_key_pair.key_name

  tags = {
    Name        = "ProdInstance"
    Environment = "Prod"
  }
}
