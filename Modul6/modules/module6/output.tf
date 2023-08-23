output "vpc_id" {
  value = var.aws_vpc_id == "" ? aws_vpc.vpc[0].id : var.aws_vpc_id
}

output "sec_grp_id" {
  value = aws_security_group.sg.id
}