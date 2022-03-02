module "dev_ngw" {
  source = "./module"

    connectivity_type = var.connectivity_type
    allocation_id = var.allocation_id
    subnet_id = var.subnet_id
    name_prefix = var.name_prefix
}