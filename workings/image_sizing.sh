#!/bin/bash
# Run through directory and create 2 files
# image
# thumbnail
# assumes portrait see how it works with landscape i think there are a few
# images will be named numbered sequentaially

# thumbs
# ==============
# thumbs

# src
# ==================================
# "/Users/me/Developer/hugo-sites/trees/workings"

# dst
# ===============================================
# "/Users/me/Developer/hugo-sites/trees/assets/images/"

# any number of dirs to add
dirs=(trees)

src="/Users/me/Developer/hugo-sites/trees/workings/"
dst="/Users/me/Developer/hugo-sites/trees/assets/images"
i=0
# tn_size=200
size=340

for dir in "${dirs[@]}"; do

    echo "looking at " . $dir
    for fileName in "$src$dir"/*; do
        i=$((i + 1))
        echo $fileName
        echo $i

        orig_width=$(identify -format "%w" "$fileName")
        orig_height=$(identify -format "%h" "$fileName")

        height=$(($size * orig_height / orig_width))
        # tn_height=$(($tn_size * orig_height / orig_width))

        echo $height
        # echo $tn_height

        # alter so this takes the filename

        file=$(basename $fileName)
        echo $file

        magick "$fileName" -resize ${size}x${height} $dst/$dir/$file
        # magick "$fileName" -resize ${tn_size}x${tn_height} $dst/$dir/thumbs/$i.jpg
    done
    i=0
done
