mkdir cprsd
for f in *.jpeg    **/*.jpeg    *jpg    **/*.jpg    *.JPEG    **/*.JPEG    *JPG    **/*.JPG;  do
	[ -f "$f" ] || continue
     ffmpeg -i "$f" -map_metadata -1 -qscale:v 0 "${f%%.*}_.JPG"
     mv "${f%%.*}_.JPG" cprsd
     echo "------"
done
