#!/bin/bash

# Function to check if AWS CLI is configured
function check_aws_cli() {
    aws sts get-caller-identity > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "AWS CLI is not configured properly. Please run 'aws configure'."
        exit 1
    fi
}

# Prompt the user for the S3 bucket name
read -p "Enter the S3 bucket name: " BUCKET_NAME

# Prompt the user for the file name
read -p "Enter the file name to upload: " FILE

# Check if the file exists in the current directory
if [ ! -f "$FILE" ]; then
    echo "File not found in the current directory!"
    exit 1
fi

# Check AWS CLI configuration
check_aws_cli

# Print the bucket name and file name for debugging
echo "Uploading $FILE to bucket $BUCKET_NAME..."

# Perform the upload to S3
OUTPUT=$(aws s3 cp "$FILE" s3://$BUCKET_NAME/ 2>&1)
STATUS=$?

# Print the output of the aws command for debugging
echo "$OUTPUT"

# Check the exit status of the aws command
if [ $STATUS -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "File upload failed!"
fi