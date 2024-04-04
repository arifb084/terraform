variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  default     = []  # You can provide default values here
}
variable "subnet_cidr_blocks" {
  description = "A list of CIDR blocks"
  type        = list(string)
  default     = ["10.10.160.0/24", "10.10.170.0/24", "10.10.180.0/24", "10.10.190.0/24", "10.10.110.0/24", "10.10.120.0/24", "10.10.130.0/24", "10.10.140.0/24", "10.10.150.0/24"]  # You can provide default values here
}
