provider "aws" {
  region = "us-east-1"
}


variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

variable "sg2_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8080, 3036, 443]
}

resource "aws_security_group" "dynamic-sg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

}

# resource dynamic "aws_vpc_security_group_ingress_rule" {

#   for_each = var.sg2_ports
#   iterator = port

#   content {
#     security_group_id = aws_security_group.dynamic-sg.id
#     cidr_ipv4         = "0.0.0.0/0"
#     from_port         = port.value
#     ip_protocol       = "tcp"
#     to_port           = port.value
#   }
# }

# resource dynamic "aws_vpc_security_group_egress_rule" {

#   for_each = var.sg2_ports
#   iterator = port

#   content {
#     security_group_id = aws_security_group.dynamic-sg.id
#     cidr_ipv4         = "0.0.0.0/0"
#     from_port         = port.value
#     ip_protocol       = "tcp"
#     to_port           = port.value
#   }
# }


# Below is the OLD method of creating a dynamic security group

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
