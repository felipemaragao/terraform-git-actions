terraform {
  required_providers {
   
  aws = {
      source = "hashicorp/aws"
    }
  }
  

   backend "s3" {
    bucket = "qualify-terraform-state"
  #  dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}