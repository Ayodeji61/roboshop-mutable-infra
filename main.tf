module "vpc" {
  source = "./vendor/modules/vpc"
  vpc    = var.vpc
  env    = var.env
  management_vpc = var.management_vpc

}

output "merged" {
  value = merge(module.vpc.private_subnets.subnets)
}