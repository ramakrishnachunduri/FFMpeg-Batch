mkdir jpg
for /f "tokens=*" %%a in ('dir /b /s *.gif') do ffmpeg -i "%%a" -qscale 0 "jpg/%%~na.jpg"