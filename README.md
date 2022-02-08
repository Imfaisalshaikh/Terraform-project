# terraform-project
Provisioning  AWS Infrastructure

Account 2
▪	Provision an S3 bucket in Region B
Using Terraform HCL, provisioning aws_s3_bucket naming my_bucket in the us-west-1 region.


Account 1
▪	Provision a custom VPC with a private subnet
Creating Virtual private cloud in the us-east-1 region along with private subnet. 

▪	Provision an EC2 instance within the private subnet with direct access to the S3 bucket provisioned on Account 2 (Step 1.a.i)
Saving everything in terraform_state within S3 as a safe storage place and providing direct access to EC2 to S3 service. 
