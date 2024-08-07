provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "random" {}

resource "random_id" "name_suffix" {
  byte_length = 4
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
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
