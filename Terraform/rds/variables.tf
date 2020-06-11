variable "region" {
  default = "us-east-1"
}  
variable "azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c","us-east-1d","us-east-1e","us-east-1f"]  
}
variable "cidr_block" {
  default = "172.31.0.0/16"  
}
variable "subnet" {
  default = ["subnet-58455b12","subnet-6a2f6436","subnet-76eea111","subnet-b84b4bb7","subnet-dd8b19e3","subnet-e60d58c8"]  
}
variable "ami" {
  default = "packer-ami-wordpress-app-v2"
}