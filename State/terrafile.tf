module "servers" {
    source = "./servers"
#    servers = 1

    hostname = "hostname"
    instance_type = "t3.micro"
    az = "us-west-2a"
    profile = "DEV"
}

output "ip_address" {
    value = module.servers.ip_address
    # nome_do_modulo.nome_output

}


# module "rds" {
#     source = "./rds"
#     db_username = "user"
#     db_password = "123"

# }


