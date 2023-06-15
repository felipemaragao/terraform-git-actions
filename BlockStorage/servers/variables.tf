variable "servers" {
    type = string
}


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

variable "blocks" {
    type = list(object({
         device_name = string
         volume_size = string
         volume_type = string
    }))
    description = "List of EBS Block"

    default =  [{
        device_name = "/dev/sdg"
        volume_size = 5
        volume_type = "gp2"
    },
     {
        device_name = "/dev/sdh"
        volume_size = 10
        volume_type = "gp2"
    }]
}

output "blocks_output" {
  value = var.blocks
}



variable "tags" {
    type        = map(string)
    description = "Tags do recurso"
    default = {"Name" = "lab-terraform-tst", "Ambiente" = "Desenvolvimento"}
  
    # validation {
    #     condition = length(var.tag_cnpj_cliente) > 5 && length(var.tag_cnpj_cliente)<10 && substr(var.tag_cnpj_cliente, 0, 5)=="CNPJ-"
    #     error_message = "valor da variável informada está inválida"    
    # }
   
}