for f in *.mkv;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -vn -acodec aac "${f%%.*}.aac"
done
