mkdir compressed
for /f "tokens=*" %%a in ('dir /b /s *.jpeg *.jpg') do ffmpeg -i "%%a" -sameq "compressed/%%~na.jpg"