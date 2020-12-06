for f in *.mkv    **/*.mkv    *.MKV    **/*.MKV;  do
	[ -f "$f" ] || continue
	ffmpeg -i "$f" -an -sn -vcodec libx265 "${f%%.*}.mp4"
done
