

variable "key_name" {

  default = "terraform-key"

}



variable "pvt_key_name" {

  default = "/root/.ssh/terraform-pvt-key.pem"

}





variable "sg_id" {

  default = "sg-74d5ea08"

}



variable "region" {

  default = "us-east-2"

}
