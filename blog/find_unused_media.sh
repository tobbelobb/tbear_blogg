#!/bin/bash

find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.ogg" -o -iname "*.webm" \) -print0 | while IFS= read -r -d '' file; do
  if ! grep -rq --include="index.html" "$(basename "$file")" .; then
    echo "$file"
  fi
done
