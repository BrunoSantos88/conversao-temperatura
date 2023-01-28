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
  default = "subnet-0f76ebdd71a1d6b17"
}

variable "subenet_A_networking" {
  type    = string
  default = "subnet-04ef500f601f04698"
}

variable "subenet_C_networking" {
  type    = string
  default = "subnet-0e2f2437e64ea6a3f"
}

variable "security" {
  type    = string
  default = "sg-069f0e8a02686cfd7"
}

variable "admin" {
  type    = string
  default = "kubenews"
}

variable "senha" {
  type    = string
  default = "Pg#kubenews"
}


