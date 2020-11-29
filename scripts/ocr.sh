#!/usr/bin/env bash

if [ -z $1 ]; then
        echo "You need to specifiy a source directory"
        echo "Usage: > ocr_scan source_dir target_dir"
        exit 0
fi
if [ -z $2 ]; then
        echo "You need to specifiy a target directory"
        echo "Usage: > ocr_scan source_dir target_dir"
        exit 0
fi


if [ ! -d "$1" ]; then
    echo "Source directory at $1 does not exist"
    exit 0
fi

if [ "$1" == "$2" ]; then
    echo "Cannot overwrite originals. Choose a different path"
    exit 0
fi

if [ ! -d "$2" ]; then
    mkdir -p $2
fi

echo "Copying Directory $1 to $2"

cp -R $1/. $2

echo "finding pdf files"

find $2 -type f  -name "*.pdf" -exec pdfsandwich -lang deu -rgb -quiet -nthreads 6 -omp_thread_limit 2 -o "{}" "{}" \;


