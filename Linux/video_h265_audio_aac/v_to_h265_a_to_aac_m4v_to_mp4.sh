for f in *.m4v    **/*.m4v    *.M4V    **/*.M4V;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -acodec aac -vcodec libx265 "${f%%.*}.mp4"
done
