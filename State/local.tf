locals{
    region = {
        "production" = "us-east-1"
        "homologation" = "us-east-2"
        "dev" = "us-west-1"
    }
    sg_group_role = {
        testing1 = {
            cidr_blocks = ["0.0.0.0/0"]
            port = "7070"
            protocol = "tcp"
        }
    }
}