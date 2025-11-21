# Bytt-passord-med-utilman

Et enkelt verktøy og veiledning for å bytte lokalt brukerpassord ved hjelp av en USB med `utilman.bat` og Windows Recovery Mode.

OBS: Bruk kun dette på maskiner du har autorisasjon til å administrere. Misbruk kan være ulovlig.

## Hva er dette?

Dette repositoryet inneholder en batch-fil (`utilman.bat`) og en enkel prosedyre som lar deg midlertidig erstatte `utilman.exe` (Ease of Access) med `cmd.exe`, slik at du kan endre et lokalt brukers passord fra innloggingsskjermen.

## Forutsetninger

- Du har fysisk tilgang og autorisasjon til maskinen.
- En USB-pinne med `utilman.bat` i roten.
- Mulighet til å starte Windows i Recovery Mode (Feilsøking -> Avanserte alternativer -> Ledetekst).


## Trinnvis guide

1️⃣ Start PC i Recovery Mode

- Hold inne `Shift` mens du trykker `Restart`.
- Hold inne `Shift` til boot-skjermen vises.
- Vent ca. 5 sekunder før du slipper tasten.

2️⃣ Åpne kommandolinje

- Velg `Feilsøking` (Troubleshoot).
- Gå til `Avanserte alternativer`.
- Velg `Ledetekst` (Command Prompt).

3️⃣ Finn riktig disk (USB)

- Skriv inn:

  ```
  diskpart
  list volume
  ```

- Se hvilken bokstav som tilhører USB-en.
- Skriv `exit` for å gå ut av Diskpart.

4️⃣ Kjør utilman.bat

- Skriv inn:

  ```
  D:\utilman.bat
  ```

  (Bytt `D:` med riktig stasjonsbokstav for USB-en.)

- Velg **Steg 1** i menyen for å ta backup av `utilman.exe` og erstatte den med `cmd.exe`.
- Reboot PC-en.

5️⃣ Endre passord via innloggingsskjermen

- På innloggingsskjermen, trykk på personen nederst i venstre hjørne (hjelpemiddel-ikonet).
- Skriv inn samme kommando som du brukte for å åpne `utilman.bat` i Recovery Mode (f.eks. `D:\utilman.bat`).
- Velg **Steg 2** i menyen og følg instruksjonene for å endre passordet.

6️⃣ Gjenopprett utilman.exe

- Start PC-en tilbake i Recovery Mode.
- Åpne kommandolinje og kjør `utilman.bat` igjen.
- Velg **Steg 3** i menyen for å gjenopprette original `utilman.exe`.

## Viktig sikkerhet og ansvar

- Dette verktøyet gir midlertidig systemtilgang og må brukes ansvarlig.
- Gjenopprett alltid original `utilman.exe` etter endring.
- Velg et sterkt passord og informer eventuelle berørte brukere/eiere.
- Bruk kun på systemer der du har uttrykkelig tillatelse.