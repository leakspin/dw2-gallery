#!/bin/bash

for a in "$@"
do
    echo "$a"

    filename=$(basename -- "$a")

    ffmpeg -i "$a" -vf scale=500:-1 images/thumbs/"$filename"

    echo $filename
done