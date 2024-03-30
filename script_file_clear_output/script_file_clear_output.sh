#!/bin/bash

# Prompt user for input file name
read -p "Enter the input file name: " input_file

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Prompt user for output file name
read -p "Enter the output file name: " output_file

# Execute the command with input and output file names
cat "$input_file" | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > "$output_file"-processed

echo "Processing complete. Output written to '$output_file'-processed."

