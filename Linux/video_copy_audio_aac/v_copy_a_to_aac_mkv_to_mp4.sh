for f in *.mkv;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -vcodec copy -acodec aac "${f%%.*}.mp4"
done
