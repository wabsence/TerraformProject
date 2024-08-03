resource "aws_eip" "myeip" {
  domain = "vpc"
}

resource "aws_eip" "myeip02" {
  domain = "vpc"
  provider = aws.aws02
}