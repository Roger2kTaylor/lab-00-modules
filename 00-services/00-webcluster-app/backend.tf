# ////////////////////////////////////////////
# BACKEND RESOURCE
# ////////////////////////////////////////////

/*

terraform {
  backend "s3" {
    # Partial configuration. The other settings (e.g., bucket, region) will be
    # passed in from a file via -backend-config arguments to 'terraform init'
    key     = "global/s3/stage/services/webserver-cluster/terraform.tfstate"
    profile = "roger-lab"
  }
}

*/