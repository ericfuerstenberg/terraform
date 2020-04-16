resource "aws_instance" "cloud" {
    ami = "${var.ami}"
    instance_type = "t2.micro"

    tags = {
        Name = "Public IP"
    }
}

resource "aws_eip" "elastic_ip" {
    instance = "${aws_instance.cloud.id}"
  
}

output "Public IP" {
    value = "${aws_eip.elastic_ip.public_ip}"
}

