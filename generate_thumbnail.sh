#!/bin/bash

filename=$(basename -- "$1")

ffmpeg -i "$1" -vf scale=500:-1 images/thumbs/"$filename"

echo $filename