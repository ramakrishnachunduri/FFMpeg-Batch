del filelist.txt

for /f "tokens=*" %%a in ('dir /b /s *.mkv') do echo file %%~na.mkv >> "filelist.txt"

ffmpeg -f concat -i "filelist.txt" -vcodec copy -acodec copy "concated.mp4"

del filelist.txt