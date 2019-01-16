#!/bin/bash

for a in images/raw/*
do
    echo "$a"

    filename=$(basename -- "$a")
    extension="${filename##*.}"

    if [ ! -f "images/thumbs/$filename" ]
    then
        ffmpeg -i "$a" -vf scale=500:-1 images/thumbs/"$filename"
    fi

    if [ ! -f "images/web/$filename" ]
    then
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