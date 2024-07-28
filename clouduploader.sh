#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <bucket-name> <filename>"
    exit 1
fi

BUCKET_NAME=$1
FILE=$2

# Print the bucket name and file name for debugging
echo "Bucket name: $BUCKET_NAME"
echo "File to upload: $FILE"

# Check if the file exists in the current directory
if [ ! -f "$FILE" ]; then
    echo "File not found in the current directory!"
    exit 1
fi

# Perform the upload to S3 and capture the output
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