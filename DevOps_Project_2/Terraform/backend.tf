terraform {
  backend "s3" {
    bucket = "sireesharemotestate1"
    key = "server_name/statefile"
    region = "us-west-1"
  }
}  
