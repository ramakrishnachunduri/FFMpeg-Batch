for f in *.jpeg    **/*.jpeg    *jpg    **/*.jpg    *.JPEG    **/*.JPEG    *JPG    **/*.JPG
do
     ffmpeg -i "$f" -sameq "$f.jpg"
done
