terraform {
    backend "s3" {
        bucket = "nginxremotestate"
        key = "terraform.tfstate"
        region = "eu-west-1"
    }
}
