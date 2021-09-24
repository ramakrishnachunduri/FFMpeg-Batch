mkdir webp
for f in *.webp    **/*.WEBP;  do
	[ -f "$f" ] || continue
     ffmpeg -i "$f" -q:v 0 "${f%%.*}.jpg"
     mv "$f" webp
done
