# directory name 96 shall crop 96 pixels in top and bottom
# directory name 90-96 shall crop 90 pixels in top and 96 pixels in bottom respectively
# directory name 90-96-10-12 shall crop 90 pixels in top, 96 pixels in bottom, 10 pixels in left and 12 pixels in right respectively 

for dirc in */
do
    dir_name=${dirc%*/}
    dirc=${dirc%*/}
	formats="$dir_name/*.mkv";
	if [ -n "$dirc" ] && [ "$dirc" -eq "$dirc" ] 2>/dev/null; then
  		echo "\n$dir_name is a number"
  		dirc=$(( dirc * 1))
   	    d=$(( dirc * 2 ));
   	    crp="crop=in_w:in_h-$d"
	    for fname in $formats; do
		    [ -f "$fname" ] || continue
			printf '%s\n' "letterboxing file \"$fname\""
			ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec aac -vcodec libx265 -filter:v "$crp" "${fname%%.*}.mp4"
		done
	else
  		echo "\n$dir_name is not a number"
  		cnt=$(echo "$dir_name" | grep -o "-" | wc -l)
		if [ $cnt -eq 0 ]
		then
   			echo "$dir_name has no hyphens in it"
   		elif [ $cnt -eq 3 ]
   		then
   			dy=`echo $dirc | cut -d'-' -f1`
			dyb=`echo $dirc | cut -d'-' -f2`
			dxl=`echo $dirc | cut -d'-' -f3`
			dxr=`echo $dirc | cut -d'-' -f4`
			crp="crop=in_w-$dxl-$dxr:in_h-$dy-$dyb:$dxl:$dy"
			for fname in $formats; do
	    		[ -f "$fname" ] || continue
	    		printf '%s\n' "tp-bt-le-ri croping file \"$fname\""
				ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec aac -vcodec libx265 -filter:v "$crp" "${fname%%.*}.mp4"
			done
   		elif [ $cnt -eq 1 ]
   		then
	    	dy=`echo $dirc | cut -d'-' -f1`
			dyb=`echo $dirc | cut -d'-' -f2`
			crp="crop=in_w:in_h-$dy-$dyb:0:$dy"
			for fname in $formats; do
	    		[ -f "$fname" ] || continue
				printf '%s\n' "tp-bt croping file \"$fname\""
				ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec aac -vcodec libx265 -filter:v "$crp" "${fname%%.*}.mp4"
			done
		fi
	fi
done
