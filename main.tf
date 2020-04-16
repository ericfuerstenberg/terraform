resource "aws_vpc" "cloud-engineer-vpc" {
  cidr_block = "10.0.0.0/16"
}


output "VPCID" {
  value = "${aws_vpc.cloud-engineer-vpc.id}"
}









