# Terraform simple script to provisioning objects in AWS
1. Install required packages:  
```
terraform  
make  
git  
```

2. You need to create an IAM service account with programatic access and two policies:  
```
AmazonEC2FullAccess 
AmazonVPCFullAccess  
```

3. After that export the following environment variables:  
```
export AWS_ACCESS_KEY_ID="you_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_DEFAULT_REGION="choose_a_region"
```

4. Clone this repo:  
```
git clone https://github.com/cmotta2016/terraform-aws.git
```

5. Inside terraform-aws directory run make command:  
```
cd terraform-aws
make infrastructure
```

