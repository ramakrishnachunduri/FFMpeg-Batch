mkdir compressed
for /f "tokens=*" %%a in ('dir /b /s *.jpeg *.jpg') do ffmpeg -i "%%a" -qscale 0 "%%~pacompressed\%%~na.jpg"