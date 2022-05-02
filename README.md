# ec2_rds

## This repo deploys: 

· The needed networking resources

· An EC2 instance with a public IP

· An RDS instance which EC2 can connect to

### Steps to follow: 
Go to 'set' directory <code >cd /ec2_test/set </code></p>

Initialize Terraform <code> terraform init </code></p>

View Terraform Plan <code> terraform plan -var-file="../config/dev.tfvars" </code></p>

Apply Changes <code> terraform apply -var-file="../config/dev.tfvars" </code></p>

Destroy the resources if needed <code> terraform destroy -var-file="../config/dev.tfvars" </code></p>
