for f in *.webm    **/*.webm    *.WEBM    **/*.WEBM;  do
	[ -f "$f" ] || continue
	ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -acodec aac -vcodec libx265 "${f%%.*}.mp4"
done
