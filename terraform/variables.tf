variable "aws_region" {
  description = "The AWS region to deploy the instance"
  type        = string
}


variable "AWS_ACCESS_KEY" {
  description = "The AWS access key for the provider"
  type        = string
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key for the provider"
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0b72821e2f351e396"
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
  default     = "t2.micro"
}

variable "prefix_name" {
  description = "The prefix name for the instance"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Owner       = "Vishal"
  }
}
