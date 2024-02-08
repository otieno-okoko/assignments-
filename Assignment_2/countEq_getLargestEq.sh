#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <country>"
    exit 1
fi
country="$1"
file="Year_Mag_Country.tsv"
if [ ! -f "$file" ]; then
    echo "Error: File 'Year_Mag_Country.tsv' does not exist"
    exit 1
fi
total_earthquakes=$(awk -F'\t' -v country="$country" '$3 == country {sum+=1} END {print sum}' "$file")
echo "Total Earthquakes for $country: $total_earthquakes"
largest_earthquake=$(awk -F'\t' -v country="$country" '$3 == country{print $2}' "$file" | sort -nr | head -n 1)
echo "Largest Earthquake Magnitude for $country: $largest_earthquake"