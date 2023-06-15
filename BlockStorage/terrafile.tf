module "servers" {
    source = "./servers"
    servers = 1
    instance_type = "t2.micro"  
    profile = "DEV"
}

output "ip_address" {
    value = module.servers.ip_address
    # nome_do_modulo.nome_output

}


