for f in *.png    **/*.png    *.PNG    **/*.PNG
do 
ffmpeg -i "$f" -sameq "$f.jpg"
done
