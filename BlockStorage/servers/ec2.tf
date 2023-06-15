# Obtendo AMI
data "aws_ami" "ubuntu" {
    most_recent = true
    
    owners = ["099720109477"] # Ubuntu

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["*-Default"]
    }

}


resource "aws_instance" "vpc" {
  
# ami           = "ami-0885b1f6bd170450c"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count = var.servers
  tags = {
    "Name" = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)
  }

}


resource "aws_instance" "web" {
  
# ami           = "ami-0885b1f6bd170450c"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  count = var.servers

  dynamic "ebs_block_device" {
    for_each = var.blocks
      content {
        device_name = ebs_block_device.value["device_name"]
        volume_size = ebs_block_device.value["volume_size"]
        volume_type = ebs_block_device.value["volume_type"]
    }
  }

  tags = var.tags

}

