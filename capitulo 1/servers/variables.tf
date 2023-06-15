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


variable "tags" {
    type        = map(string)
    description = "Tags do recurso"
    default = {"Name" = "lab-terraform-tst", "Ambiente" = "Desenvolvimento"}
  
    # validation {
    #     condition = length(var.tag_cnpj_cliente) > 5 && length(var.tag_cnpj_cliente)<10 && substr(var.tag_cnpj_cliente, 0, 5)=="CNPJ-"
    #     error_message = "valor da variável informada está inválida"    
    # }
   
}