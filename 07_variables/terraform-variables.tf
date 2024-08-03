provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Mnagage from terraform"
}

resource "aws_vpc_security_group_ingress_rule" "aap_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_1p
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port

}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_1p
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port

}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_1p
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port

}

