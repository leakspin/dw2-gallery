#!/bin/bash

for a in "$@"
do
    echo "$a"

    filename=$(basename -- "$a")
    name="${filename%.*}"

    ffmpeg -i "$a" -r 1 -vf scale=500:-1 -f image2 images/thumbs/"$name".jpg

    echo $name
done