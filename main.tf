module "vpc" {
  source = "./vendor/modules/vpc"
  vpc    = var.vpc
  env    = var.env
  management_vpc = var.management_vpc

}

output "apps_private_subnets" {
  value = module.vpc.private_subnets
}