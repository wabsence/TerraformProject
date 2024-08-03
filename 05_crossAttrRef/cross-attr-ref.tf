provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name        = "attribute-sg"
  description = "Allow Port 443 inbound traffic from eip public_ip_address"

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


# Below is the OLD method of creating a security group

# resource "aws_security_group" "allow_tls" {
#   name = "attribute-firewall"
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
#   }
# }
