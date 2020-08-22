for f in *.flv    **/*.flv    *.FLV    **/*.FLV;  do
	[ -f "$f" ] || continue
  ffmpeg -i "$f" -map_metadata -1 -acodec aac -vcodec libx265 "${f%%.*}.mp4"
done
