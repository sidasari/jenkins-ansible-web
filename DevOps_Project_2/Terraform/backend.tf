terraform {
  backend "s3" {
    bucket = "sireesharemotestate"
    key = "server_name/statefile"
    region = "ap-south-1"
  }
}  
