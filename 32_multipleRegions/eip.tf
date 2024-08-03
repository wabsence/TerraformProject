resource "aws_eip" "myeip" {
  domain = "vpc"
}

resource "aws_eip" "myeip02" {
  domain = "vpc"
  provider = aws.mumbai
}


output "myeip01" {
  value = aws_eip.myeip.public_ip
}

output "myeip012" {
  value = aws_eip.myeip02.public_ip
}
