#!/bin/bash

# Find all Dart files (replace *.dart with your file pattern if needed)
find . -type f -name "*.dart" | while read file; do

  # Perform the string replacement (make sure to escape special characters)
  sed -i '' 's|onTapEdit: () {}|onTapEdit: (index) {}|g' "$file"

  echo "Processed: $file"  # Optional: Print the processed file name
done
