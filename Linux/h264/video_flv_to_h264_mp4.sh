for f in *.flv    **/*.flv    *.FLV    **/*.FLV
do 
ffmpeg -i "$f" -vcodec libx264 -level 21 -b 640k -coder 1 -f psp -flags +loop -trellis 2 -partitions +parti4x4+parti8x8+partp4x4+partp8x8+partb8x8 -g 250 "$f.mp4"
done
