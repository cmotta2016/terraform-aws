create_infrastructure:
	# Initializing Terraform
	terraform init
	# Creating SSH key pair locally
	terraform apply -auto-approve -target null_resource.create_ssh_key 
	# Creating AWS ssh key
	terraform apply -auto-approve -target aws_key_pair.hello-key
	# Creating network infrastructure (VPC, Subnet, Security Group, Route and IGW)
	terraform apply -auto-approve -target module.network 
	# Creating EC2 instance
	terraform apply -auto-approve -target module.instance

destroy_infrastructure:
	# Removing provisioned infrastructure
	terraform destroy -auto-approve
