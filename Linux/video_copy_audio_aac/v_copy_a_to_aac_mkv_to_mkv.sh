for f in *.mkv;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map 0:v -map 0:a -vcodec copy -acodec aac "${f%%.*}__.mkv"
done
