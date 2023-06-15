# resource "aws_instance" "web" {
#     ami = "ami-0885b1f6bd170450c"
#     instance_type = "t2.micro"
# }
	
# # Firstly create a random generated password to use in secrets.
# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "_%@"
# }


# # Creating a AWS secret for database
#  resource "aws_secretsmanager_secret" "secretRDS" {
#   name = "secret_rds"
# }

# # Creating a AWS secret for database
#  resource "aws_secretsmanager_secret" "arn_rds" {
#   name = "arn_rds"
# }

# # Firstly create a random generated password to use in secrets.
# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "_%@"
# }

# # Creating a AWS secret versions for database master account (Masteraccoundb)
 
# resource "aws_secretsmanager_secret_version" "sversion" {
#   secret_id = aws_secretsmanager_secret.secretRDS.id
#   secret_string = <<EOF
#    {
#     "username": "postgres",
#     "password": "${random_password.password.result}"
#    }
# EOF
# }

# # Importing the AWS secrets created previously using arn.
 
# data "aws_secretsmanager_secret" "secretRDS" {
#   arn = aws_secretsmanager_secret.secretRDS.arn
# }
 
# # Importing the AWS secret version created previously using arn.
 
# data "aws_secretsmanager_secret_version" "creds" {
#   secret_id = data.aws_secretsmanager_secret.secretRDS.arn
# }
 
# # After importing the secrets storing into Locals
 
# locals {
#   db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
# }



# resource "aws_db_instance" "education" {
#   identifier             = "education"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 5
#   engine                 = "postgres"
#   engine_version         = "14.1"
#   username               = "edu"
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.education.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
#   publicly_accessible    = true
#   skip_final_snapshot    = true
# }