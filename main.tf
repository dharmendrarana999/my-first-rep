resource "aws_instance" "DKRterraform" {
  ami             = "ami-05d72852800cbf29e"
  instance_type   = "t2.micro"
  key_name        = "DharmendraRana"
  
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
