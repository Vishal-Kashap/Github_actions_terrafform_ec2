provider "aws" {
  region     = var.aws_region
}

provider "random" {}

resource "random_id" "name_suffix" {
  byte_length = 4
}

data "local_file" "userdata" {
  filename = "${path.module}/userdata.sh"
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = data.local_file.userdata.content

  tags = merge(
    var.common_tags,
    {
      Name = "${var.prefix_name}-${random_id.name_suffix.hex}"
    }
  )
}

output "instance_id" {
  value = aws_instance.ec2.id
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}
