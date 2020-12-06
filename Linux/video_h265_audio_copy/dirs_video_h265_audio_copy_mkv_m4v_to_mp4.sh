for dir in */
do
    dir_name=${dir%*/}
    formats="$dir_name/*.mkv $dir_name/*.m4v";
    for fname in $formats; do
	    [ -f "$fname" ] || continue
		printf '%s\n' "processing file is $fname"
		ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 "${fname%%.*}.mp4"
	done
done
