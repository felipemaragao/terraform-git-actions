variable "engine" {
    type = string
    default = "postgres"
}

variable "engine_version" {
    type = string
    default = "14.1"
   
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
   
}


variable "db_username" {
  description = "RDS root username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}