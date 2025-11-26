@echo off
chcp 65001 >nul
title Utilman Passordverktøy
color 0A

:: Versjon og klokke
set versjon=2.0


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

:loop
cls
set klokke=%time:~0,8%
set dato=%date%
echo ╔══════════════════════════════╗
echo ║ Tid:     %klokke%            ║
echo ║ Dato:    %dato%          ║
echo ║ Loggfil: %logPath%         ║
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

:: Vent på brukervalget (blokkerende) — trykk et tall for å velge
choice /n /c:1234 >nul
if errorlevel 4 goto steg4
if errorlevel 3 goto steg3
if errorlevel 2 goto steg2
if errorlevel 1 goto steg1
goto loop

:steg1
echo Lager backup av utilman.exe...
copy "%winDrive%\Windows\System32\utilman.exe" "%winDrive%\Windows\System32\utilman.exe.bak"
copy "%winDrive%\Windows\System32\cmd.exe" "%winDrive%\Windows\System32\utilman.exe"
echo [%date% %time%] Valg 1: utilman.exe ble byttet >> "%logPath%"
pause
goto loop

:steg2
set /p brukernavn=Brukernavn:
set /p nyttpassord=Nytt passord:
net user "%brukernavn%" "%nyttpassord%"
echo [%date% %time%] Valg 2: Passord endret for bruker "%brukernavn%" >> "%logPath%"
pause
goto loop

:steg3
copy "%winDrive%\Windows\System32\utilman.exe.bak" "%winDrive%\Windows\System32\utilman.exe"
echo [%date% %time%] Valg 3: utilman.exe gjenopprettet >> "%logPath%"
pause
goto loop

:steg4
echo [%date% %time%] Valg 4: Program avsluttet >> "%logPath%"
pause
exit