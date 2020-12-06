for dir in */
do
    dir_name=${dir%*/}
    dir=${dir%*/}
    dir=$(( dir * 1))
    formats="$dir_name/*.mkv";
    d=$(( dir * 2 ));
    for fname in $formats; do
	    [ -f "$fname" ] || continue
		printf '%s\n' "processing file is $fname"
		ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 -filter:v "crop=in_w:in_h-$d" "${fname%%.*}.mp4"
	done
done
