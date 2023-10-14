	terraform {
	  backend "s3" {
	    bucket = "terraform-expense"
	    key    = "misc/jenkins-ip/terraform.tfstate"
	    region = "us-east-1"
	
	  }
	}
	
	data "aws_instance" "instance" {
	  instance_id = "i-08e5d92f25193ed68"
	}
	
	resource "aws_route53_record" "jenkins" {
	  name    = "jenkins.sddevops18.online"
	  type    = "A"
	  zone_id = "Z0531070279OA6E0HE9DV"
	  records = [data.aws_instance.instance.public_ip]
	  ttl = 10
	}