cd /d C:\Users\julia\AppData\Roaming\The Witness

git pull

cd /d C:\Users\julia\Desktop

taskkill /The Witness.lnk

FOR /F "tokens=* USEBACKQ" %%F IN (`ptime.exe The Witness.lnk`) DO (
SET var=%%F
)

cd /d C:\Users\julia\AppData\Roaming\The Witness
git add .
git commit -m "update savegame (%var%)"
git push
pause

:repeat
exit
goto :repeat
)

