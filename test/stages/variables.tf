variable "region"{
  type = string
  default ="ap-south-1" 
  description = "Please set the region where the resouces to be created "
}

variable "access_key"{
  type = string
}
variable "secret_key"{
  type = string
}

variable "provision"{
    type = bool
    description = "Provision to true or false"
    default = false
}

variable "name" {
  type        = string
  description = "The name of the IGW instance"
  default     = "" 
}


variable "name_prefix"{
    type = string
    description = "Prefix to be added to the names of resources which are being provisioned"
    default = "swe"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the VPC is deployed. On AWS this value becomes a tag."
  default     = "default"
}

variable "_count" {
  type = number
  description = "Number of resources to be provisioned"
  default = 1
  
}
variable "connectivity_type" {
  type        = string
  description = "(Optional) Connectivity type for the gateway. Valid values are private and public. Defaults to public."
  default     = "public"  
  
}

variable "allocation_id" {
  type        = string
  description = "(Optional) The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public"
  
}
variable "subnet_id" {
  type        = string
  description = "(Required) The Subnet ID of the subnet in which to place the gateway."
  
}