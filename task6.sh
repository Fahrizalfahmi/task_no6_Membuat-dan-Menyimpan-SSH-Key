#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

directory="$1"

mkdir -p "$directory"

if [ ! -d "$directory" ]; then
    echo "Failed to create directory: $directory"
    exit 1
fi

read -p "Enter a name for your SSH key pair (e.g., my_key): " key_name

ssh-keygen -t rsa -b 2048 -C "Generated SSH key pair" -f "$directory/$key_name" -q

if [ $? -eq 0 ]; then
    echo "SSH key pair generated successfully."
else
    echo "Failed to generate SSH key pair."
fi
