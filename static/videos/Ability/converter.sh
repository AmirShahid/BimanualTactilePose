#!/bin/bash

DIR=${1:-.}

for file in "$DIR"/*.mkv; do
  if [[ -f "$file" ]]; then
    filename=$(basename -- "$file" .mkv)
    yes y | ffmpeg -i "$file" -filter:v "setpts=PTS/2" -filter:a "atempo=2.0" "$DIR/$filename.mp4"
  fi
done

