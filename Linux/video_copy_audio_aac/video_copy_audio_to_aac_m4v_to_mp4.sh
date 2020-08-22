for f in *.m4v;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -vcodec copy -acodec aac "${f%%.*}.mp4"
done
