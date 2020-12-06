for f in *.mkv    **/*.mkv    *.MKV    **/*.MKV;  do
	[ -f "$f" ] || continue
	ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 "${f%%.*}.mp4"
done
