#!/bin/bash
# Check if the file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi
# Assign the file argument to a variable
file="$1"
# Extract the top ten years with the most earthquakes
top_ten_years=$(cut -f 1 "$file" | sort | uniq -c | sort -nr | head -n 10 | awk '{print $2}')
# Loop over the top ten years
for year in $top_ten_years; do
  # Extract earthquakes for the current year and write to a file
  grep -w "$year" "$file" > "${year}-earthquakes.txt"
done
echo "Files created successfully."
