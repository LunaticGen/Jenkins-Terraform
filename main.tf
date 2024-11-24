provider "aws" {
    region = var.aws_region 
}

resource "aws_security_group" "new-sg" {
    name = "jenkins-terraform-sg"

    #Inbound Traffic
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    #Outbound Traffic
    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "myFirstInstance" {
  ami                    = "ami-06b21ccaeff8cd686"
  key_name               = ""
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.new-sg.id]
}