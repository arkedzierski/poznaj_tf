module "module6" {
  source   = "./modules/module6"
  vpc_cidr = "172.16.1.0/24"
  sg_name  = "testowa"
  tags     = local.common_tags
  ingress = [{
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
  egress = [{
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

locals {
  common_tags = {
    Owner = "akedzierski"
  }
}