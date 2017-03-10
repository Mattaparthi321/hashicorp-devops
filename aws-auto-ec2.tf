#aws.tf
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECURITY_KEY" {}

provider "aws" {
        region = "us-east-1"
        access_key = "${var.AWS_ACCESS_KEY}"
        secret_key = "${var.AWS_SECURITY_KEY}"
}

resource "aws_key_pair" "mfgpoc-key" {
        key_name = "mfgpoc-key"
        public_key = "XXXXXX"
}

resource "aws_instance" "web" {
        ami = "ami-f0768de6"
        instance_type = "t2.micro"
        key_name = "${aws_key_pair.mfgpoc-key.key_name}"
        tags {
                Name = "mfgpoc-key-ec2-01"
        }
}
