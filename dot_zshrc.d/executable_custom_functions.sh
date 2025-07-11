# NOTE: Silencing the output of export with >/dev/null 2>&1

# Open a folder using z and a partial string input
function vsz { vsc `ze $@` }
export -f vsz >/dev/null 2>&1

# Print Environment variables of a beanstalk environment in JSON
function getEBENV { aws elasticbeanstalk describe-configuration-settings --application-name $1 --environment-name $2 | jq -r '.ConfigurationSettings | .[] | .OptionSettings | .[] | select(.Namespace == "aws:elasticbeanstalk:application:environment")' }
export -f getEBENV >/dev/null 2>&1

# Convert JSON output from beanstalk cli to env string
function beanstalk_option_to_env { jq -rS '"\(.OptionName)=\(.Value)"' | sort }
export -f beanstalk_option_to_env >/dev/null 2>&1

# Update the environment variables for a beanstalk environment
function updateEBENV { aws elasticbeanstalk update-environment --environment-name $1 --option-settings $2 }
export -f updateEBENV >/dev/null 2>&1

# Get the ip address/hostname for an ssh host (usually defined in .ssh/config)
function ssh_host_to_ip { ssh -G $1 | grep -iw hostname | cut -d ' ' -f 2 | tr -d '\n' | xargs echo}
export -f ssh_host_to_ip >/dev/null 2>&1

# Get AWS Account ID
function aws_account_id { aws sts get-caller-identity | jq -r '.Account' }
export -f aws_account_id >/dev/null 2>&1

# Get AWS Default Region
function aws_default_region { aws ec2 describe-availability-zones | jq -r '.AvailabilityZones[0].RegionName' }
export -f aws_default_region >/dev/null 2>&1

# Get ECR URL
function aws_ecr_url { echo "$(aws_account_id).dkr.ecr.$(aws_default_region).amazonaws.com" }
export -f aws_ecr_url >/dev/null 2>&1

# AWS ECR Login
function docker_ecr_login { aws ecr get-login-password --region "$(aws_default_region)" | docker login --username AWS --password-stdin "$(aws_ecr_url)" }
export -f docker_ecr_login >/dev/null 2>&1

