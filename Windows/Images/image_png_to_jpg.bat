mkdir jpg
for /f "tokens=*" %%a in ('dir /b /s *.png') do ffmpeg -i "%%a" -sameq "jpg/%%~na.jpg"