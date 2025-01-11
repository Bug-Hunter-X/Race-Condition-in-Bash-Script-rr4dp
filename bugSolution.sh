#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to acquire a lock before writing to the file
flock -x "file1.txt" && (echo "Content for file1" > file1.txt) && flock -u "file1.txt"
flock -x "file2.txt" && (echo "Content for file2" > file2.txt) && flock -u "file2.txt"

# Check the content of the files. The content should be complete and correct.
cat file1.txt
cat file2.txt