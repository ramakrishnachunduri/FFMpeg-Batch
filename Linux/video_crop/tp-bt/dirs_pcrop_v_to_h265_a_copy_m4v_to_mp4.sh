for dir in */
do
    dir_name=${dir%*/}
    dir=${dir%*/}
    echo $dir
    dy=`echo $dir | cut -d'-' -f1`
	echo $dy
	dyb=`echo $dir | cut -d'-' -f2`
	echo $dyb
	
    formats="$dir_name/*.m4v";
    for fname in $formats; do
	    [ -f "$fname" ] || continue
		printf '%s\n' "processing file is $fname"
		ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 -filter:v "crop=in_w:in_h-$dy-$dyb:0:$dy" "${fname%%.*}.mp4"
	done
done
