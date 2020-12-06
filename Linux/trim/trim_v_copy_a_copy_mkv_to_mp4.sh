for f in *.mkv    **/*.mkv    *.MKV    **/*.MKV;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -ss 00:00:04 -vcodec copy -acodec copy "${f%%.*}.mp4"
done
