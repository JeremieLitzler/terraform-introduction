# Load environment variables
source .env
# Validate .tf files are valid
terraform validate
# Format .tf files
terraform fmt 
# Pull provider binary
# and
# Init state
terraform init 
# What terraform needs to do and what exists, what is removed or updated
terraform plan
# Connect to provider
# Create, modify or destroy resources
terraform create
# Destroy everything
terraform destroy 
# Destroy one targeted resource
terraform destroy -target "resource_x"
