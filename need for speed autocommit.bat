cd /d C:\Users\julia\Documents\NFS Most Wanted

git pull

cd /d E:\Games\Need For Speed Most Wanted Redux

taskkill /speed.exe

FOR /F "tokens=* USEBACKQ" %%F IN (`ptime.exe speed.exe`) DO (
SET var=%%F
)

cd /d C:\Users\julia\Documents\NFS Most Wanted
git add .
git commit -m "update savegame (%var%)"
git push
pause

:repeat
exit
goto :repeat
)

