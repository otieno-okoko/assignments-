#!/bin/bash
# Check if the country argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <country>"
  exit 1
fi
# Assign the country argument to a variable
country="$1"
# Extract the country column, filter for the specified country, and count occurrences
count=$(cut -f 3 Year_Mag_Country.tsv | grep -c "^$country$")
# Display the result
echo "Total number of earthquakes in $country: $count"
