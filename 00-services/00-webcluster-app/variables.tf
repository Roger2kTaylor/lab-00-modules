# ////////////////////////////////////////////
# VARIABLES
# ////////////////////////////////////////////

# HTTP Port
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

# Web Cluster Name
variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

# DB Remote State Bucket Name
variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

# DB Remote State key
variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

# DB Instance Type
variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

# ASG Minimum Size
variable "min_size" {
  description = "The minimum number of EC2 Instancesin the ASG"
  type        = number
}

# ASG Maximum Size
variable "max_size" {
  description = "The maximum number of EC2 Instancesin the ASG"
  type        = number
}

