resource "aws_instance" "web" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "Web Server"
    }
    count = 3 
}

