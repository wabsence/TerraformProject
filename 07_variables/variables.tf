variable "vpn_1p" {
  default     = "201.0.62.210/32"
  description = "This is a VPN server created in AWS"
}


variable "app_port" {
  default = "8080"
}

variable "ssh_port" {
  default = "22"
}

variable "ftp_port" {
  default = "21"
}
