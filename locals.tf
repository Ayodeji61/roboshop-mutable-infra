locals {
  private_subnets = tomap({ for k, v in module.vpc.private_subnets : "subnets" => v.subnets })
}