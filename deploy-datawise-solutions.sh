#!/bin/bash

# ========= Configuration =========
AWS_REGION="${AWS_REGION:-us-east-1}"
DEFAULT_INSTANCE_TYPE="${DEFAULT_INSTANCE_TYPE:-t2.micro}"
DEFAULT_BUCKET_PREFIX="${DEFAULT_BUCKET_PREFIX:-datawise-solutions-bucket}"

declare -a CREATED_RESOURCES=()
INSTANCE_TYPE="$DEFAULT_INSTANCE_TYPE"
BUCKET_NAME="${DEFAULT_BUCKET_PREFIX}-$(date +%s)"

# ========= Error Handling =========
handle_error() {
    echo "Error on line $1. Exiting."
    exit 1
}
trap 'handle_error $LINENO' ERR

# ========= Pre-checks =========
if ! command -v aws >/dev/null 2>&1; then
    echo "AWS CLI not found. Please install and configure it."
    exit 1
fi

# ========= Functions =========

create_ec2_instance() {
    echo "Creating EC2 instance of type $INSTANCE_TYPE in $AWS_REGION..."

    # NOTE: Make sure the AMI ID matches your selected region
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0c02fb55956c7d316 \
        --count 1 \
        --instance-type "$INSTANCE_TYPE" \
        --region "$AWS_REGION" \
        --query "Instances[0].InstanceId" \
        --output text)

    echo "EC2 Instance created: $INSTANCE_ID"
    CREATED_RESOURCES+=("EC2:$INSTANCE_ID")
}

create_s3_bucket() {
    echo "Creating S3 bucket: $BUCKET_NAME in $AWS_REGION..."

    if [[ "$AWS_REGION" == "us-east-1" ]]; then
        aws s3api create-bucket \
            --bucket "$BUCKET_NAME"
    else
        aws s3api create-bucket \
            --bucket "$BUCKET_NAME" \
            --region "$AWS_REGION" \
            --create-bucket-configuration LocationConstraint="$AWS_REGION"
    fi

    echo "S3 Bucket created: $BUCKET_NAME"
    CREATED_RESOURCES+=("S3:$BUCKET_NAME")
}

verify_resources() {
    echo "Verifying created resources:"
    for resource in "${CREATED_RESOURCES[@]}"; do
        echo "$resource"
    done
}

usage() {
    echo "Usage: $0 [-t instance_type] [-b bucket_name]"
    echo "  -t    EC2 instance type (default: $DEFAULT_INSTANCE_TYPE)"
    echo "  -b    S3 bucket name (default: auto-generated)"
    echo "  -h    Show this help message"
    exit 1
}

# ========= Parse Command Line Arguments =========
while getopts ":t:b:h" opt; do
  case $opt in
    t) INSTANCE_TYPE="$OPTARG" ;;
    b) BUCKET_NAME="$OPTARG" ;;
    h) usage ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage ;;
  esac
done

# ========= Main =========
echo "Starting deployment..."
echo "Using region: $AWS_REGION"
echo "Instance type: $INSTANCE_TYPE"
echo "S3 Bucket: $BUCKET_NAME"

create_ec2_instance
create_s3_bucket
verify_resources

echo "Deployment completed successfully!"
