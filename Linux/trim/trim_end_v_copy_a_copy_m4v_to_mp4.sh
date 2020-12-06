for f in *.m4v    **/*.m4v    *.M4V    **/*.M4V;  do
	[ -f "$f" ] || continue
	dur=$(ffprobe -i "$f" -show_entries format=duration -v quiet -of csv="p=0")
	#trim=$((dur-15))
	trim=`expr "$dur - 15" | bc`
	ffmpeg -i "$f" -t $trim -vcodec copy -acodec copy "${f%%.*}.mp4"
done
