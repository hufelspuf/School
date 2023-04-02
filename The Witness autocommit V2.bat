@echo off
set GameExe=witness64_d3d11.exe
set SavePath=C:\Users\julia\AppData\Roaming\The Witness
set GamePath=where witness64_d3d11.exe
cd /d %SavePath%
git pull


echo Starting "%GameExe%"...
for /f "delims=" %%a in ('%GamePath%') do set MY_DIR=%%~dpa
cd /d %MY_DIR%
echo Current directory is: %CD%
start "" "%GameExe%"

echo Waiting for "%GameExe%" to close...
:LOOP
tasklist /nh /fi "imagename eq %GameExe%" | find /i "%GameExe%" > nul
if not errorlevel 1 (
    SET var=%%F
    timeout /t 1 > nul
    goto LOOP
)

echo "%GameExe%" has been closed. Performing post-exit actions...
cd /d %SavePath%
git add .
git commit -m "update savegame (%var%)"
git push
pause

