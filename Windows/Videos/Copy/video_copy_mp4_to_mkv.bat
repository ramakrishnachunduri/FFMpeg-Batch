for /f "tokens=*" %%a in ('dir /b /s *.mp4') do ffmpeg -i "%%a" -map_metadata -1 -vcodec copy -acodec copy "%%~pna.mkv"