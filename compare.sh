#!/bin/bash

#compare all files in 2 folders.

# Check if two folder paths are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <folder1> <folder2>"
    exit 1
fi

folder1="$1"
folder2="$2"

# Check if the provided paths are directories
if [ ! -d "$folder1" ] || [ ! -d "$folder2" ]; then
    echo "Both arguments must be valid directories."
    exit 1
fi

# Iterate through files in folder1
for file1 in "$folder1"/*; do
    # Extract the filename from the path
    filename=$(basename "$file1")

    # Check if the same filename exists in folder2
    file2="$folder2/$filename"

    # Check if the file in folder2 exists
    if [ -f "$file2" ]; then
        # Run diff on the two files
        diff -y "$file1" "$file2" | less
    else
        echo "File $filename not found in $folder2"
    fi
done
