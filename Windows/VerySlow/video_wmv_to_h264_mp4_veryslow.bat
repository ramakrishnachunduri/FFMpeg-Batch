for /f "tokens=*" %%a in ('dir /b /s *.wmv') do ffmpeg -i "%%a" -vcodec libx264 -preset veryslow  "%%~pna.mp4"