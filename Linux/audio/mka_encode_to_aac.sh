for f in *.mka;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -acodec aac "${f%%.*}.aac"
done
