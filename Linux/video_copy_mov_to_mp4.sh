for f in *.mov    **/*.MOV
do 
ffmpeg -i "$f" -vcodec copy -acodec copy "$f.mp4"
done
