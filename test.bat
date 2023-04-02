@echo off
set MY_DIR_PATH=where witness64_d3d11.exe
for /f "delims=" %%a in ('%MY_DIR_PATH%') do set MY_DIR=%%~dpa
cd /d %MY_DIR%
echo Current directory is: %CD%

pause
