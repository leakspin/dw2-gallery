#!/bin/bash

for a in images/raw/*
do

    filename=$(basename -- "$a")
    extension="${filename##*.}"

    if [ ! -f "images/thumbs/$filename" -a ! -f "images/web/$filename" ]
    then
        echo "$a"

        ffmpeg -i "$a" -vf scale=500:-1 images/thumbs/"$filename"

        if [[ $extension == 'jpg' ]]
        then
            jpegtran -optimize -copy none -perfect -v "$a" > images/web/"$filename"
        elif [[ $extension == 'png' ]]
        then
            optipng -out images/web/"$filename" "$a"
        else
            cp "$a" images/web/"$filename"
        fi
    fi
done