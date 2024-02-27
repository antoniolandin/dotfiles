#!/bin/bash
# Description: Fix the names of the files in the current directory to be microsoft friendly
# Author: antonio

find . | grep -E '[?¿]' | while read file; do
    newfile=$(echo $file | tr -d "¿?")
    echo "Renaming $file to $newfile"
    mv "$file" "$newfile"
done
