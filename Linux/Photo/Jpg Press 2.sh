for f in *.jpeg    **/*.jpeg    *jpg    **/*.jpg    *.JPEG    **/*.JPEG    *JPG    **/*.JPG
do
     ffmpeg -i "$f" -qscale 0 "$f.jpg"
done
