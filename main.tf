module "vpc" {
  for_each = var.vpc
  source = "./vendor/modules/vpc"
  cidr_block = each.value.cidr_block
  additional_cidr_block = each.value.additional_cidr_block
  private_subnets = each.value.private_subnets
  public_subnets = each.value.public_subnets
  subnet_availability_zones = each.value.subnet_availability_zones
  env            = var.env
  management_vpc = var.management_vpc
}

module "docdb" {
  for_each = var.docdb
  source = "./vendor/modules/docdb"
  name = each.key
  engine   = each.value.engine
  env    = var.env
  subnets = flatten([for i, j in module.vpc : j.private_subnets["app"]["subnets"][*].id])
}


module "rds" {
  source = "./vendor/modules/rds"
  rds    = var.rds
  env    = var.env
  subnets = flatten([for i, j in module.vpc : j.private_subnets["app"]["subnets"][*].id])
  allocated_storage = 10
  engine = "aurora-mysql"
  engine_version = "5.7.mysql_aurora.2.03.2"
  instance_class = "db.t3.micro"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true

}

