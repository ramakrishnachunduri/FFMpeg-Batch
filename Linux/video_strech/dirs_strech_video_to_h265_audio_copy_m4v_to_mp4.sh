for dir in */
do
    dir_name=${dir%*/}
    dir=${dir%*/}
    echo $dir
    dw=`echo $dir | cut -d'-' -f1`
	echo $dw
	dh=`echo $dir | cut -d'-' -f2`
	echo $dh
	
    formats="$dir_name/*.m4v";
    for fname in $formats; do
	    [ -f "$fname" ] || continue
		printf '%s\n' "processing file is $fname"
		ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 -filter:v "scale=$dw:$dh,setsar=1:1" "${fname%%.*}.mp4"
	done
done
