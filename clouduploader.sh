#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/file"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi