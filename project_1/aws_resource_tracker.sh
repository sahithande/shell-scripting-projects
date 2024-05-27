#!/bin/bash

##########################
# Owner: Sahithande

# Date: May-22nd

# Version: v1

# This script will report the aws resource usage.

##########################

set -x  # runs the script in debug mode

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM


# list all the s3 buckets in aws acccount
echo "print the list of s3 buckets."
aws s3 ls > resourceTracker

# list all the active ec2 instances
echo "print the list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list lambda functions
echo "print the list of lambda functions"
aws lambda list-functions >> resourceTracker

# list iam uses
echo "print the list of iam users in the account"
aws iam list-users >> resourceTracker
