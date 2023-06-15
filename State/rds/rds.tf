data "aws_vpc" "vpc_selected" {
    filter {
        name = "tag:Name"
        values = ["RDS"]
    }

}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_selected.id]
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}


data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.vpc_selected.id
   tags = {
    Name = "Qualify"
  }
}



resource "aws_db_subnet_group" "education" {
  name       = "education"
 # subnet_ids = module.vpc.public_subnets
  subnet_ids = data.aws_subnets.example.ids

  tags = {
    Name = "Education"
  }
}

resource "aws_db_parameter_group" "education" {
  name   = "education"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "education" {
  identifier             = "education"
  instance_class         = var.instance_class 
  allocated_storage      = 5
  engine                 = var.engine
  engine_version         = var.engine_version
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}