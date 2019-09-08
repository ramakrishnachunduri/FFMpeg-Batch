mkdir jpg
for /f "tokens=*" %%a in ('dir /b /s *.png') do ffmpeg -i "%%a" -qscale 0 "%%~pajpg/%%~na.jpg"