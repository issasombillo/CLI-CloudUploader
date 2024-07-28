#!/bin/bash

# Check if the number of arguments is exactly 1
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"/path/to/file\""
    exit 1
fi

# Assign the first argument to the FILE variable
FILE=$1

# Print the file path for debugging
echo "File to upload: $FILE"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

# Set the S3 bucket name
BUCKET_NAME=issa1

# Print the bucket name for debugging
echo "Uploading $FILE to bucket $BUCKET_NAME..."

# Print AWS environment variables for debugging
echo "AWS Access Key: $AWS_ACCESS_KEY_ID"
echo "AWS Secret Key: $AWS_SECRET_ACCESS_KEY"
echo "Current Directory: $(pwd)"

# Perform the upload to S3
aws s3 cp "$FILE" s3://$BUCKET_NAME/

# Check the exit status of the aws command
if [ $? -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "File upload failed!"
fi
