#instance
resource "aws_instance" "nginx-container"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.sshkeyname
    security_groups = [
        aws_security_group.nginxsecurity.name
    ]
    tags = {
        Name = var.instance_name
    }
}


#security group
resource "aws_security_group" "nginxsecurity" {
    name = var.sgname
    ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }
     ingress {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["77.4.92.144/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
     }    
}
resource "aws_s3_bucket" "remote_bucket" {
  bucket = var.terraformbucket
  acl    = "private"
  tags = {
    Name        = "terraformbucket"
    Environment = "nginx-container"
  }
}
