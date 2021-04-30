resource "aws_instance" "DKRterraform" {
  ami             = "ami-05d72852800cbf29e"
  instance_type   = "t2.micro"
  key_name        = "DharmendraRana"
  vpc_security_group_ids = [ "${aws_security_group.instance.id}" ]
  tags = {
       Name  = "DKRterraform"
   }
  lifecycle {
    create_before_destroy = true
  }

 

  
   
    connection {
      host = "${aws_instance.DKRterraform.public_ip}"
      type     = "ssh"
      user     = "ec2-user"
      private_key = "${file("DharmendraRana.pem")}"
      
    }
  

 

}

 

resource "aws_security_group" "instance" {
  name = "DKR-sg"
  description = "Allow traffic for instances"

 

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

 

  ingress {
    protocol    = "tcp"
    from_port   = 95
    to_port     = 95
    cidr_blocks = ["0.0.0.0/0"]
  }

 

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
