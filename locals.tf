/*
locals {
  app_private_subnets = lookup(lookup(lookup({ for k, v in module.vpc.private_subnets : "subnets" => v.subnets }, "subnets", null), "app", null), "subnets", null)

  database_private_subnets = lookup(lookup(lookup({ for k, v in module.vpc.private_subnets : "subnets" => v.subnets }, "subnets", null), "database", null), "subnets", null)

  frontend_private_subnets = lookup(lookup(lookup({ for k, v in module.vpc.private_subnets : "subnets" => v.subnets }, "subnets", null), "frontend", null), "subnets", null)

  public_subnets = lookup(lookup(lookup({ for k, v in module.vpc.public_subnets : "subnets" => v.subnets }, "subnets", null), "public", null), "subnets", null)
}

//output "public_subnets" {
 // value = local.public_subnets[*].id
//}

*/

locals {
  alb = {
    public = {
      vpc_cidr = "0.0.0.0/0"
    }
    private = {
      vpc_cidr = element([for i, j in module.vpc : j.vpc_cidr], 0)
    }
  }
  merged_alb = tomap({
  for i in keys(var.alb) : i => {
    internal = var.alb[i].internal
    y = local.alb[i].vpc_cidr
  }
  })
}
