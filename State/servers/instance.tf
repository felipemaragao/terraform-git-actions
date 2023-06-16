resource "aws_key_pair" "main"{
  key_name = "felipe-keypair"
  public_key = "SHA256:w89jHEH8NCczVwUfzQeXbmn6gb/rduRkigBnTCc+8TA"
}


resource "aws_instance" "main" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  # relaciona com security group já existente
  vpc_security_group_ids = ["${data.aws_security_group.main.id}"]
  # relaciona com o security criado
  # vpc_security_group_ids = ["${aws_security_group.main.id}"]
  subnet_id = tolist(data.aws_subnets.main.ids)[0]
  key_name = aws_key_pair.main.key_name

  root_block_device {
   volume_type = var.root_block_device_volume_type
   volume_size = var.root_block_device_volume_size
   delete_on_termination = var.root_block_device_delete_on_termination

   tags = {
    instance = var.hostname
   }
  }

# utilizando pipeline não cria uma infra nova
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  tags = {
    Name = var.hostname
  }
  
  # executa quando a máquina for criada
  user_data =<<EOF
  #!/bin/bash
  sudo hostnamectl set-hostname ${var.hostname}.${var.domain}
  EOF
}


# Elastic IP
resource "aws_eip" "main" {
  instance = aws_instance.main.id
}

# resource "aws_eip_association" "eip_assoc" {
#   instance_id = aws_instance.main.id
#   allocation_id = aws_eip.main.id
# }


  # dynamic "ebs_block_device" {
  #   for_each = var.blocks
  #     content {
  #       device_name = ebs_block_device.value["device_name"]
  #       volume_size = ebs_block_device.value["volume_size"]
  #       volume_type = ebs_block_device.value["volume_type"]
  #   }
  # }






# resource "aws_instance" "vpc" {
  
# # ami           = "ami-0885b1f6bd170450c"
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   count = var.servers
#   tags = {
#     "Name" = cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)
#   }

# }


