@echo off
chcp 65001 >nul
title Utilman Passordverktøy
color 0A

:: Versjon og klokke
set versjon=1.7
set dato=%date%
set klokke=%time:~0,8%

:: Sett loggsti til samme mappe som skriptet
set "logPath=%~dp0logg.txt"

:: Finn riktig Windows-stasjon med både utilman.exe og cmd.exe
for %%D in (C D E F G H) do (
    if exist %%D:\Windows\System32\utilman.exe (
        if exist %%D:\Windows\System32\cmd.exe (
            set "winDrive=%%D:"
        )
    )
)

:: Sjekk at stasjon ble funnet
if not defined winDrive (
    echo Fant ikke Windows-installasjon med både utilman.exe og cmd.exe. Avbryter.
    pause
    exit
)

:menu
cls
echo ╔══════════════════════════════╗
echo ║ Tid:     %klokke%            ║
echo ║ Dato:    %dato%          ║
echo ║ Versjon: %versjon%                 ║
echo ╚══════════════════════════════╝
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                      Utilman Passord-Reset Verktøy                        ║
echo ╠═══════════════════════════════════════════════════════════════════════════╣
echo ║  1 - Bytte utilman.exe med cmd.exe                                        ║
echo ║                                                                           ║
echo ║  2 - Endre passord                                                        ║
echo ║                                                                           ║
echo ║  3 - Gjenopprette utilman.exe                                             ║
echo ║                                                                           ║
echo ║  4 - Avslutt                                                              ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p valg= Skriv inn valg (1-4): 

:: Logg valget
echo [%dato% %time%] Valg %valg% kjørt >> "%logPath%"

if "%valg%"=="1" goto steg1
if "%valg%"=="2" goto steg2
if "%valg%"=="3" goto steg3
if "%valg%"=="4" goto slutt
echo Ugyldig valg. Prøv igjen.
pause
goto menu

:steg1
echo Lager backup av utilman.exe...
copy "%winDrive%\Windows\System32\utilman.exe" "%winDrive%\Windows\System32\utilman.exe.bak"
echo Erstatter utilman.exe med cmd.exe...
copy "%winDrive%\Windows\System32\cmd.exe" "%winDrive%\Windows\System32\utilman.exe"
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
echo [%date% %time%] Valg 1: utilman.exe ble byttet med cmd.exe på %winDrive% >> "%logPath%"
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
echo [%date% %time%] Valg 2: Passord endret for bruker "%brukernavn%" >> "%logPath%"
pause
goto menu

:steg3
echo Gjenoppretter original utilman.exe...
copy "%winDrive%\Windows\System32\utilman.exe.bak" "%winDrive%\Windows\System32\utilman.exe"
echo Ferdig! Du kan starte maskinen på nytt manuelt når du vil.
echo [%date% %time%] Valg 3: utilman.exe ble gjenopprettet fra backup på %winDrive% >> "%logPath%"
pause
goto menu

:slutt
echo [%date% %time%] Valg 4: Program avsluttet >> "%logPath%"
exit
