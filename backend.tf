terraform {
  backend "s3" {
    bucket = "s3-bucket-terraform-backend"
    region = "us-east-1"
    dynamodb_table = "my-dynamobd-table"
    key = "state/terraform.tfstate"
  }
}
