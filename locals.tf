locals {
  private_subnets = tomap({for k, v in module.vpc.private_subnets : k => v.subnets})
}