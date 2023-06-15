module "servers" {
    source = "./servers"
    servers = 1
     instance_type = "t2.micro"  
      profile = "DEV"
     providers = {
        aws.east = aws.east
    }
}

output "ip_address" {
    value = module.servers.ip_address
    # nome_do_modulo.nome_output

}

module "server" {
    source = "./servers"
    servers = 1
    instance_type = "t2.micro"
    tags= {"Cliente" = "Qualify", "Ambiente" = "Desenvolvimento"}
    profile = "DEV"
    providers = {
      aws.east = aws.west
    }
}