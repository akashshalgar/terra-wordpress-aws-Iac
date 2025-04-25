 Terraform AWS Web Infrastructure – WordPress Hosting
This project uses **Terraform** to provision a **modular AWS infrastructure** to host a **WordPress website** using:
- **EC2** (for WordPress)
- **RDS MySQL** (managed DB)
- **VPC with public/private subnets**
- **Internet Gateway & NAT Gateway**
- Fully automated with a **user-data script**

## 🚀 Quick Start Commands

**Initialize Terraform modules**

>> terraform init

**Plan infrastructure (Dev environment example)**
>> terraform plan -var-file="environments/dev/terraform.tfvars"

**Apply configuration**
>> terraform apply --auto-approve -var-file=environments/dev/terraform.tfvars

**Destroy infrastructure (Dev environment example)**
>> terraform destroy --auto-approve -var-file=environments/dev/terraform.tfvars



---
