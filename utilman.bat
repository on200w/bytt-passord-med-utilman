@echo off
chcp 65001 >nul
title Utilman Passordverktøy
color 0A

:: Versjon og klokke
set versjon=2.2

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
    echo [%date% %time%] ERROR: Fant ikke Windows-installasjon med både utilman.exe og cmd.exe >> "%logPath%"
    pause
    exit
)

:meny
cls
set klokke=%time:~0,8%
set dato=%date%
echo ╔═════════════════════════════════╗
echo ║          Versjon %versjon%            ║
echo ╠═════════════════════════════════╣
echo ║ Tid:        %klokke%            ║
echo ║ Dato:       %dato%          ║
echo ║ Loggfil:    %logPath%         ║
echo ║ WinStasjon: %winDrive%\Windows\System32 ║
echo ╚═════════════════════════════════╝
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

:: Vent på brukervalget — skriv tallet og trykk Enter (bedre i Recovery Mode)
set "valg="
set /p "valg=Velg handling 1-4: "
if "%valg%"=="1" goto steg1
if "%valg%"=="2" goto steg2
if "%valg%"=="3" goto steg3
if "%valg%"=="4" goto steg4
:: Hvis ugyldig eller tomt, vis meny på nytt
goto meny

:steg1
echo Lager backup av utilman.exe...
copy "%winDrive%\Windows\System32\utilman.exe" "%winDrive%\Windows\System32\utilman.exe.bak"
if "%errorlevel%" neq "0" (
    echo [%date% %time%] ERROR: Kunne ikke ta backup av utilman.exe i %winDrive%\Windows\System32 >> "%logPath%"
) else (
    copy "%winDrive%\Windows\System32\cmd.exe" "%winDrive%\Windows\System32\utilman.exe"
    if "%errorlevel%" neq "0" (
        echo [%date% %time%] ERROR: Kunne ikke kopiere cmd.exe til utilman.exe i %winDrive%\Windows\System32 >> "%logPath%"
    ) else (
        echo [%date% %time%] Valg 1: utilman.exe ble byttet i %winDrive%\Windows\System32 >> "%logPath%"
    )
)
pause
goto meny

:steg2
set /p brukernavn=Brukernavn:
set /p nyttpassord=Nytt passord:
net user "%brukernavn%" "%nyttpassord%"
if "%errorlevel%" neq "0" (
    echo [%date% %time%] ERROR: Kunne ikke endre passord for bruker "%brukernavn%" >> "%logPath%"
) else (
    echo [%date% %time%] Valg 2: Passord endret for bruker "%brukernavn%" >> "%logPath%"
)
pause
goto meny

:steg3
copy "%winDrive%\Windows\System32\utilman.exe.bak" "%winDrive%\Windows\System32\utilman.exe"
if "%errorlevel%" neq "0" (
    echo [%date% %time%] ERROR: Kunne ikke gjenopprette utilman.exe i %winDrive%\Windows\System32 >> "%logPath%"
) else (
    echo [%date% %time%] Valg 3: utilman.exe gjenopprettet i %winDrive%\Windows\System32 >> "%logPath%"
)
pause
goto meny

:steg4
echo [%date% %time%] Valg 4: Program avsluttet >> "%logPath%"
pause
exit