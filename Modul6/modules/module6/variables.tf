variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC. Default is 10.0.0.0/16"
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 32))
    error_message = "CIDR must have correct format"
  }
}


variable "sg_name" {
  type        = string
  description = "Security group name"

}

variable "aws_vpc_id" {
  type        = string
  description = "Id of existing VPC"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags for created resources"
}

variable "ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = [{
    from_port = 65535
    to_port   = 65535
    protocol  = "-1"
    cidr_blocks = ["255.255.255.255/32"]
  }]
}

variable "egress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port = 65535
    to_port   = 65535
    protocol  = "-1"
    cidr_blocks = ["255.255.255.255/32"]
  }]
}