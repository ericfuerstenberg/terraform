variable "ec2name" {
    type = "string"
}

resource "aws_instance" "module-ec2" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "${var.ec2name}"
    }
}
