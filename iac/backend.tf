# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "saudat-terraform-remote-state"
    key            = "rentzone-app/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
  }
}
