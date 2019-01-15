#!/bin/bash

filename=$(basename -- "$1")
name="${filename%.*}"

ffmpeg -i "$1" -r 1 -vf scale=500:-1 -f image2 images/thumbs/"$name".jpg

echo $name