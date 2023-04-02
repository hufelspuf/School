@echo off
cd /d C:\Users\julia\AppData\Roaming\The Witness
git pull
cd /d C:\Users\julia\Desktop

FOR /F "tokens=* USEBACKQ" %%F IN (`ptime.exe where witness64_d3d11.exe`) DO (
    SET var=%%F
)

echo Starting "witness64_d3d11.exe"...
set MY_DIR_PATH=where witness64_d3d11.exe
for /f "delims=" %%a in ('%MY_DIR_PATH%') do set MY_DIR=%%~dpa
cd /d %MY_DIR%
echo Current directory is: %CD%
start "" "witness64_d3d11.exe"

echo Waiting for "witness64_d3d11.exe" to close...
:LOOP
tasklist /nh /fi "imagename eq witness64_d3d11.exe" | find /i "witness64_d3d11.exe" > nul
if not errorlevel 1 (
    timeout /t 1 > nul
    goto LOOP
)

echo "witness64_d3d11.exe" has been closed. Performing post-exit actions...
cd /d C:\Users\julia\AppData\Roaming\The Witness
git add .
git commit -m "update savegame (%var%)"
git push
pause

