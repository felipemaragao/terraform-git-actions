variable "profile" {
    type = string
}

variable "nome" {
    type = string
    default = "padrao"
      sensitive = true
}

variable "image_id" {
    type = string
    default = "ami-12345678"
   
}

variable "instance_type" {
    type = string
    # default = "t2.micro"
   
}

variable "subnet_tier" {
    description = "Tier of subnets (Publkic or Private)"
    type = string
    default = "private"
   
}


variable "az" {
    type = string
    default = "us-west-2a"
   
}

variable "hostname" {
    type = string
    default = "hostname"
   
}

variable "domain" {
    type = string
    default = "qualify"
   
}

variable "root_block_device_delete_on_termination" {
    type = bool
    default = true
   
}

variable "root_block_device_volume_size" {
    type = string
    default = "8"
   
}

variable "root_block_device_volume_type" {
    type = string
    default = "gp2"
   
}





# variable "blocks" {
#     type = list(object({
#          device_name = string
#          volume_size = string
#          volume_type = string
#     }))
#     description = "List of EBS Block"


#     # default =  [{
#     #     device_name = "/dev/sdg"
#     #     volume_size = 5
#     #     volume_type = "gp2"
#     # },
#     #  {
#     #     device_name = "/dev/sdh"
#     #     volume_size = 10
#     #     volume_type = "gp2"
#     # }]
# }

# output "blocks_output" {
#   value = var.blocks
# }




variable "tags" {
    type        = map(string)
    description = "Tags do recurso"
    default = {"Name" = "lab-terraform-tst", "Ambiente" = "Desenvolvimento"}
 
    # validation {
    #     condition = length(var.tag_cnpj_cliente) > 5 && length(var.tag_cnpj_cliente)<10 && substr(var.tag_cnpj_cliente, 0, 5)=="CNPJ-"
    #     error_message = "valor da variável informada está inválida"    
    # }
   
}