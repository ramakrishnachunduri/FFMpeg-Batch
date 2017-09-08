md trimmed_start
set /a "_durS=5"
for /f "tokens=*" %%a in ('dir /b /s *.mp4') do ffmpeg -i "%%a" -ss %_durS% -vcodec copy -acodec copy "trimmed_start/%%~na.mp4"