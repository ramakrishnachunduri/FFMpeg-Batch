for f in *.flv    **/*.flv    *.FLV    **/*.FLV;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -vcodec copy -acodec copy "${f%%.*}.mp4"
done
