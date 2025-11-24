@echo off
chcp 65001 >nul
title Utilman Passordverktøy
color 0A

:menu
echo ╔════════════════════════════════════════════════════════════╗
echo ║              Utilman Passord-Reset Verktøy                 ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║  1 - Bytte utilman.exe med cmd.exe                         ║
echo ║  2 - Endre passord                                         ║
echo ║  3 - Gjenopprette utilman.exe                              ║
echo ║  4 - Avslutt                                               ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
set /p valg= Skriv inn valg (1-4): 

if "%valg%"=="1" goto steg1
if "%valg%"=="2" goto steg2
if "%valg%"=="3" goto steg3
if "%valg%"=="4" goto slutt
goto menu

:steg1
echo Lager backup av utilman.exe...
copy c:\windows\system32\utilman.exe c:\windows\system32\utilman.exe.bak
echo Erstatter utilman.exe med cmd.exe...
copy c:\windows\system32\cmd.exe c:\windows\system32\utilman.exe
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
pause
goto menu

:steg2
echo Skriv inn brukernavn:
set /p brukernavn=
echo Skriv inn nytt passord (trykk Enter for blankt):
set /p nyttpassord=
echo Endrer passord for %brukernavn% ...
net user "%brukernavn%" "%nyttpassord%"
echo Ferdig! Hvis ingen feilmelding vises, er passordet endret.
pause
goto menu

:steg3
echo Gjenoppretter original utilman.exe...
copy c:\windows\system32\utilman.exe.bak c:\windows\system32\utilman.exe
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
pause
goto menu

:slutt
exit