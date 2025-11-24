@echo off
chcp 65001 >nul
title Utilman Passordverktøy
color 0A

:: Sett versjon og klokke/dato
set versjon=1.4
set dato=%date% 
set klokke=%time:~0,8%

:menu
cls
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                       Utilman Passord-Reset Verktøy                       ║
echo ╠═══════════════════════════════════════════════════════════════════════════╣
echo ║ Tid:  %klokke%                                                            ║
echo ║ Dato: %dato%                                                         ║
echo ║ Versjon: %versjon%                                                              ║
echo ╠═══════════════════════════════════════════════════════════════════════════╣
echo ║  1 - Bytte utilman.exe med cmd.exe                                        ║
echo ║  2 - Endre passord                                                        ║
echo ║  3 - Gjenopprette utilman.exe                                             ║
echo ║  4 - Avslutt                                                              ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p valg= Skriv inn valg (1-4): 

:: Logg valget
echo [%dato% %klokke%] Valg %valg% kjørt >> logg.txt

if "%valg%"=="1" goto steg1
if "%valg%"=="2" goto steg2
if "%valg%"=="3" goto steg3
if "%valg%"=="4" goto slutt
echo Ugyldig valg. Prøv igjen.
pause
goto menu

:steg1
echo Lager backup av utilman.exe...
copy c:\windows\system32\utilman.exe c:\windows\system32\utilman.exe.bak
echo Erstatter utilman.exe med cmd.exe...
copy c:\windows\system32\cmd.exe c:\windows\system32\utilman.exe
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
echo [%date% %time%] Valg 1: utilman.exe ble byttet med cmd.exe, backup lagret som utilman.exe.bak >> logg.txt
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
echo [%date% %time%] Valg 2: Passord endret for bruker "%brukernavn%" >> logg.txt
pause
goto menu

:steg3
echo Gjenoppretter original utilman.exe...
copy c:\windows\system32\utilman.exe.bak c:\windows\system32\utilman.exe
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
echo [%date% %time%] Valg 3: utilman.exe ble gjenopprettet fra backup >> logg.txt
pause
goto menu

:slutt
echo [%date% %time%] Valg 4: Program avsluttet >> logg.txt
exit