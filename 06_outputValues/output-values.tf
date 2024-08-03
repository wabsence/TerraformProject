provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "myinstance" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
}

output "public_ip" {
  #   value = aws_instance.myinstance.public_ip
  value = "https://${aws_instance.myinstance.public_ip}:8080"
}
