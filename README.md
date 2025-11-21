


# Bytt-passord-med-utilman

Et enkelt verktøy og veiledning for å bytte lokalt brukerpåord ved hjelp av en USB med `utilman.bat` og Windows Recovery Mode.

OBS: Bruk kun dette på maskiner du har autorisasjon til å administrere. Misbruk kan være ulovlig.

## Hva er dette?

Dette repositoryet inneholder en batch-fil (`utilman.bat`) og en enkel prosedyre som lar deg midlertidig erstatte `utilman.exe` (Ease of Access) med `cmd.exe`, slik at du kan endre et lokalt brukers passord fra innloggingsskjermen.

## Forutsetninger

- Du har fysisk tilgang og autorisasjon til maskinen.
- En USB-pinne med `utilman.bat` i roten.
- Mulighet til å starte Windows i Recovery Mode (Feilsøking -> Avanserte alternativer -> Ledetekst).

## Trinnvis guide

1. Start Windows i Recovery Mode

	- Hold inne `Shift` og velg `Restart` fra innloggingsskjermen eller Start-menyen.
	- Velg `Feilsøking` (Troubleshoot) -> `Avanserte alternativer` -> `Ledetekst` (Command Prompt).

2. Finn riktig stasjonsbokstav for USB-en

	- I ledeteksten skriv:

	  ```
	  diskpart
	  list volume
	  exit
	  ```

	- Merk hvilken bokstav som er tilordnet USB-en (f.eks. `D:`). Bruk denne i neste steg.

3. Kjør `utilman.bat` fra USB

	- Skriv inn stasjonsbokstaven og filbanen, f.eks:

	  ```
	  D:\utilman.bat
	  ```

	- Velg menyvalget for å ta backup av `utilman.exe` og erstatte det med `cmd.exe` (typisk "Steg 1").
	- Start maskinen på nytt (reboot).

4. Endre passord fra innloggingsskjermen

	- På innloggingsskjermen klikker du på Hjelpemiddel-ikonet (Ease of Access) nederst til venstre.
	- Det skal nå åpne en kommandolinje (cmd) som systembruker.
	- For å liste lokale brukere skriv:

	  ```
	  net user
	  ```

	- For å sette nytt passord for en bruker:

	  ```
	  net user Brukernavn NyttPassord
	  ```

	- Bytt ut `Brukernavn` og `NyttPassord` med riktig bruker og ønsket passord.

5. Gjenopprett original `utilman.exe`

	- Start maskinen tilbake i Recovery Mode og åpne `Ledetekst`.
	- Kjør `utilman.bat` fra USB igjen og velg menyvalget for å gjenopprette original `utilman.exe` (typisk "Steg 3").

## Viktig sikkerhet og ansvar

- Dette verktøyet gir midlertidig systemtilgang og må brukes ansvarlig.
- Gjenopprett alltid original `utilman.exe` etter endring.
- Velg et sterkt passord og informer eventuelle berørte brukere/eiere.
- Bruk kun på systemer der du har uttrykkelig tillatelse.

## Feilsøking

- Kan du ikke komme inn i Recovery Mode? Bruk en Windows-installasjonsmedia for å starte avanserte alternativer.
- Finner du ikke `utilman.bat`? Kontroller at filen ligger i roten på USB og at du bruker riktig stasjonsbokstav.
- Hvis `net user` ikke finner bruker, sjekk brukernavnet med `net user` uten parametre.

## Innhold i repo

- `utilman.bat` : Batch-scriptet som tar backup av `utilman.exe`, erstatter den med `cmd.exe` og gjenoppretter den etterpå. Sjekk og gjennomgå innholdet før bruk.

## Lisens / Kontakt

Bruk fritt, men ansvarlig. For spørsmål, beskriv kort problemstillingen og legg ved relevante detaljer.

