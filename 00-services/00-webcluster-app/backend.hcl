# backend.hcl
bucket         = "remote-tfstate-2l6dn"
region         = "us-east-2"
dynamodb_table = "remote-tf-locks"
encrypt        = true
