variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  default     = []  # You can provide default values here
}
variable "subnet_cidr_blocks" {
  description = "A list of CIDR blocks"
  type        = list(string)
  default     = ["10.10.60.0/24", "10.10.70.0/24"]  # You can provide default values here
}
