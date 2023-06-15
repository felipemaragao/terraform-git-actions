provider "aws" {
  region  = "us-east-1"
  alias  = "east"
  profile = "DEV"
}

provider "aws" {
  region  = "us-west-2"
  alias = "west"
  profile = "PROD"
}


