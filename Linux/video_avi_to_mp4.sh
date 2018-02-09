for f in *.avi    **/*.avi    *.AVI    **/*.AVI
do 
ffmpeg -i "$f" -g 250 -sameq "$f.mp4"
done
