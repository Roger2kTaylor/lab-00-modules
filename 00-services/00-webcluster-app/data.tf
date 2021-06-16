# ////////////////////////////////////////////
# AWS DATA RESOURCES
# ////////////////////////////////////////////

# Default VPC
data "aws_vpc" "default" {
  default = true
}

# Default VPC Subnets
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Terraform Remote State DB Information
data "terraform_remote_state" "db_instance" {
  backend = "s3"
  config = {
    bucket  = var.db_remote_state_bucket
    key     = var.db_remote_state_key
    region  = "us-east-2"
    profile = "roger-lab"
  }
}

# Template File User Data
data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
  vars = {
    server_port = var.server_port
    db_address  = data.terraform_remote_state.db_instance.outputs.address
    db_port     = data.terraform_remote_state.db_instance.outputs.port
  }
}

