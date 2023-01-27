# --- comput/variables.tf ---
variable "jenks_instance_type" {
  type    = string
  default = "t2.large"
}

variable "regions" {
  type    = string
  default = "us-east-1a"
}

###AMI
variable "key" {
  type    = string
  default = "minhaaws"
}
 ##Amazonlinux2 'us-east-1'
variable "amazonlinux2" {
  type    = string
  default = "ami-0b93ce03dcbcb10f6"
}

 ##ubuntu 'us-east-1'
variable "ubuntu2004" {
  type    = string
  default = "ami-0b93ce03dcbcb10f6"
}

#Servidores
variable "jenkinsServer" {
  type    = string
  default = "Jenkins*Server"
}


#networking
variable "subenet_B_networking" {
  type    = string
  default = "subnet-0326d405ec5afeb52"
}

variable "security_networking" {
  type    = string
  default = "sg-0d04e09789726df49"
}



