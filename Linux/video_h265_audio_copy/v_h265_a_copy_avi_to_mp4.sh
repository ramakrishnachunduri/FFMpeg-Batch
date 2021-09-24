for f in *.avi    **/*.avi    *.AVI    **/*.AVI;  do
	[ -f "$f" ] || continue
	ffmpeg -i "$f" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 "${f%%.*}.mp4"
done
