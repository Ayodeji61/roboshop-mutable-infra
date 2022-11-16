module "vpc" {
  source = "./vendor/modules/vpc"
  vpc    = var.vpc
  env    = var.env
  management_vpc = var.management_vpc

}

output "app_private_subnets" {
  value = lookup(lookup(local.private_subnets, "subnets", null), "apps", null)
}