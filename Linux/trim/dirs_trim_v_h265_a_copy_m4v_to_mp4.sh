# directory name 96 shall trim at 96 seconds start
# directory name 90-96 shall trim 90 seconds at start and 96 seconds at end respectively

echo "\n"
for dirc in */
do
    dir_name=${dirc%*/}
    dirc=${dirc%*/}
	formats="$dir_name/*.m4v";
	if [ -n "$dirc" ] && [ "$dirc" -eq "$dirc" ] 2>/dev/null; then
  		#echo "\n$dir_name is a number"
  		dirc=$(( dirc * 1))
   	    d=$(( dirc * 1 ));
   	    crp="crop=in_w:in_h-$d"
	    for fname in $formats; do
		    [ -f "$fname" ] || continue
			printf '%s\n' "triming \"$fname\" $d seconds at start"
			ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -ss "00:00:$d" -acodec copy -vcodec libx265 "${fname%%.*}.mp4"
		done
	else
  		#echo "\n$dir_name is not a number"
  		cnt=$(echo "$dir_name" | grep -o "-" | wc -l)
		if [ $cnt -eq 0 ]
		then
   			#echo "$dir_name has no hyphens in it"
   			echo "\n"
   		elif [ $cnt -eq 1 ]
   		then
	    	dy=`echo $dirc | cut -d'-' -f1`
			dyb=`echo $dirc | cut -d'-' -f2`
			for fname in $formats; do
	    		[ -f "$fname" ] || continue
				printf '%s\n' "triming \"$fname\" $dy seconds at start and $dyb seconds at end"
				
				dur=$(ffprobe -i "$fname" -show_entries format=duration -v quiet -of csv="p=0")
				#trim=$((dur-15))
				trim=`expr "$dur - $dyb - $dy" | bc`
				echo "Trim is $trim"
				ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -ss "00:00:$dy" -t $trim -acodec copy -vcodec libx265 "${fname%%.*}.mp4"
			done
		fi
	fi
done
