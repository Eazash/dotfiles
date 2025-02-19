# NOTE: Silencing the output of export with >/dev/null 2>&1

# Open a folder using z and a partial string input
function vsz { vsc `ze $@` }
export -f vsz >/dev/null 2>&1

# Print Environment variables of a beanstalk environment in JSON
function getEBENV { aws elasticbeanstalk describe-configuration-settings --application-name $1 --environment-name $2 | jq -r '.ConfigurationSettings | .[] | .OptionSettings | .[] | select(.Namespace == "aws:elasticbeanstalk:application:environment")' }
export -f getEBENV >/dev/null 2>&1

# Convert JSON output from beanstalk cli to env string
function beanstalk_option_to_json { jq -rS '"\(.OptionName)=\(.Value)"' | sort }
export -f beanstalk_option_to_json >/dev/null 2>&1

# Update the environment variables for a beanstalk environment
function updateEBENV { aws elasticbeanstalk update-environment --environment-name $1 --option-settings $2 }
export -f updateEBENV >/dev/null 2>&1

# Get the ip address/hostname for an ssh host (usually defined in .ssh/config)
function ssh_host_to_ip { ssh -G $1 | grep -iw hostname | cut -d ' ' -f 2 | tr -d '\n' | xargs echo}
export -f ssh_host_to_ip >/dev/null 2>&1

# AWS ECR Login
function docker_ecr_login { aws ecr get-login-password --region $2 | docker login --username AWS --password-stdin "$1.dkr.ecr.$2.amazonaws.com" }
export -f docker_ecr_login >/dev/null 2>&1

