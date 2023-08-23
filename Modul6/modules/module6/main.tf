resource "aws_vpc" "vpc" {
  count                = var.aws_vpc_id == "" ? 1 : 0
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = var.tags

  lifecycle {
    postcondition {
      condition     = length(self.id) > 0
      error_message = "The VPC ID cannot be empty"
    }
  }
}

resource "aws_security_group" "sg" {
  name   = "${var.sg_name}-sg"
  vpc_id = var.aws_vpc_id == "" ? aws_vpc.vpc[0].id : var.aws_vpc_id
  tags   = var.tags

  #Allow HTTP from VPN, NAT and local
  dynamic "ingress" {
    for_each = var.ingress

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  #allow all outbound
  dynamic "egress" {
    for_each = var.egress

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  lifecycle {
    precondition {
      condition     = var.ingress[0].to_port >= var.ingress[0].from_port && var.egress[0].to_port >= var.egress[0].from_port 
      error_message = "The to_port cannot be less than from_port"
    }

    postcondition {
      condition     = self.id != ""
      error_message = "The ID cannot be empty"
    }
  }

  depends_on = [ aws_vpc.vpc ]
}
