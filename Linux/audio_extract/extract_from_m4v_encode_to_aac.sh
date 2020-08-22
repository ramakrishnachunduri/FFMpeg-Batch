for f in *.m4v;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -vn -acodec aac "${f%%.*}.aac"
done
