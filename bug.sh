#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously
(echo "Content for file1" > file1.txt &) && (echo "Content for file2" > file2.txt &)

# Wait for both processes to finish
wait

# Check the content of the files. The content may be incomplete or overwritten due to race condition. 
cat file1.txt
cat file2.txt