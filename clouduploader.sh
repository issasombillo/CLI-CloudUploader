#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 "C:\Users\LENOVO-PC\Documents\Road to Millionaire\Cloud Engr\CLI-CloudUploader\test.txt""
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

BUCKET_NAME=issa1

aws s3 cp "$FILE" s3://$BUCKET_NAME/

if [ $? -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "File upload failed!"
fi