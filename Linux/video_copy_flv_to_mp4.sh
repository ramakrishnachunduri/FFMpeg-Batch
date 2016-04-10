for f in *.flv    **/*.flv    *.FLV    **/*.FLV   
do 
ffmpeg -i "$f" -vcodec copy -acodec copy "$f.mp4"
done
