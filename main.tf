locals{
  prefix_name  = var.name_prefix != "" && var.name_prefix != null ? var.name_prefix : local.resource_group_name
  resource_group_name = var.resource_group_name != "" && var.resource_group_name != null ? var.resource_group_name : "default"
  
  ngw_name  = var.name != "" ? var.name : "${local.prefix_name}-ngw"

  ngw_id = var.provision ? aws_nat_gateway.nat_gw[0].id : ""
  #ngw_arn = var.provision ? aws_nat_gateway.nat_gw[0].arn : ""
  # vpc_id = var.provision ? data.aws_vpc.vpc[0].id : null  

  provision_eip = var.connectivity_type == "public" ?( ( var.allocation_id == "" || var.allocation_id == null ) ?  true : false ): false

  allocation_id =  local.provision_eip ? aws_eip.nat_gw_eip[0].id : var.allocation_id
}


##########################################################
# Create NAT Gateway
# For Public NAT gateway, create Elastic IP and add to Nat Gw
##########################################################


# resource null_resource print_names {
#   count = var.provision ? 1 : 0

#   provisioner "local-exec" {
#     command = "echo 'VPC name: ${var.vpc_name != null ? var.vpc_name : "null"}'"
#   }
# }

# data "aws_vpc" "vpc" {
#   depends_on = [
#     null_resource.print_names
#   ]
#   count = var.provision ? 1 : 0

#   tags = {
#     Name = var.vpc_name
#   }
# }

resource "aws_nat_gateway" "nat_gw" {
  count = var.provision ? 1 : 0
  allocation_id = local.allocation_id
  connectivity_type = var.connectivity_type
  subnet_id = var.subnet_id
  tags ={ 
      Name = local.ngw_name, 
      ResourceGroup = local.resource_group_name
    }
  
}

resource "aws_eip" "nat_gw_eip" {
  count = local.provision_eip ? 1 : 0
  vpc = true
 
}


