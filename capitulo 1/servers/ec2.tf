# Obtendo AMI
data "aws_ami" "ubuntu" {
    most_recent = true
    
    owners = ["099720109477"] # Ubuntu

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}


#
data "aws_ami" "ubuntu-west-2" {
    most_recent = true
    
    owners = ["099720109477"] # Ubuntu

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

resource "aws_instance" "web-west-2" {
  ami           = data.aws_ami.ubuntu-west-2.id
  instance_type = var.instance_type
  provider = aws.east
    


}


resource "aws_instance" "web" {
  
# ami           = "ami-0885b1f6bd170450c"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count = var.servers
  tags = var.tags

}

