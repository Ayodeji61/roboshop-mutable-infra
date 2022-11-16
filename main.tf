module "vpc" {
  source = "./vendor/modules/vpc"
  vpc    = var.vpc
  env    = var.env
  management_vpc = var.management_vpc

}

output "private_subnets" {
  value = {for k, v in module.vpc.private_subnets : k => v.subnets}
}