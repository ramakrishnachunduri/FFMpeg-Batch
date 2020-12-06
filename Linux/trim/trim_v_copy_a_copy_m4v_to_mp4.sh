for f in *.m4v    **/*.m4v    *.M4V    **/*.M4V;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -ss 00:00:04 -vcodec copy -acodec copy "${f%%.*}.mp4"
done
