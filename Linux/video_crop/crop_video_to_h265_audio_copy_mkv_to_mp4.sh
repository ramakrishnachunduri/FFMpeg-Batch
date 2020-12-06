f="$(basename -- $PWD)";
d=$(( f * 2 ));
for fname in *.mkv **/*.mkv **/**/*.mkv; do
    [ -f "$fname" ] || continue
    printf '%s\n' "processing file is $fname"
    ffmpeg -i "$fname" -map_metadata -1 -map_chapters -1 -acodec copy -vcodec libx265 -filter:v "crop=in_w:in_h-$d" "${fname%%.*}.mp4"
done


