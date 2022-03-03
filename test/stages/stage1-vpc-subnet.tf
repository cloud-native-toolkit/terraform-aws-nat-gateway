module "dev_vpc_subnet" {
  source                          = "github.com/cloud-native-toolkit/terraform-aws-vpc-subnets"
  vpc_id                          = module.dev_vpc.vpc_id
  provision=var.provision
  provision_igw = var.provision
  provision_ngw = var.provision
  prefix_name = var.name_prefix
  
  private_subnet_cidr             = ["10.0.125.0/24"]
  public_subnet_cidr              = ["10.0.0.0/20"]
  availability_zones              = var.availability_zones
  map_customer_owned_ip_on_launch = false
  map_public_ip_on_launch         = false
  tags                            = var.tags
  # public_subnet_tags              = var.public_subnet_tags
  # private_subnet_tags             = var.private_subnet_tags
  # acl_rules_pub_in = var.acl_rules_pub_in
  # acl_rules_pub_out = var.acl_rules_pub_out
  # acl_rules_pri_in= var.acl_rules_pri_in
  # acl_rules_pri_out = var.acl_rules_pri_out

  


}