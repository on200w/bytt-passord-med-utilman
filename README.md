🔹 Resette lokal bruker passord med USB og utilman.bat

1️⃣ Start PC i Recovery Mode
• Hold inne Shift mens du trykker Restart.
• Hold inne Shift til boot-skjermen vises.
• Vent ca. 5 sekunder før du slipper tasten.

2️⃣ Åpne kommandolinje
• Velg Feilsøking (Troubleshoot).
• Gå til Avanserte alternativer.
• Velg Ledetekst (Command Prompt).

3️⃣ Finn riktig disk (USB)
• Skriv inn:
    1. diskpart
    2. list volume

• Se hvilken bokstav som tilhører USB-en.
• Skriv exit for å gå ut av Diskpart.

4️⃣ Kjør utilman.bat – steg 1
• Skriv inn:
d:\utilman.bat
(Bytt d: med riktig stasjonsbokstav for USB-en.)

• Velg Steg 1 i menyen for å ta backup av utilman.exe og erstatte den med cmd.exe.
• Reboot PC-en.

5️⃣ Endre passord via innloggingsskjermen
• På innloggingsskjermen trykk på mannen nederst i venstre hjørne (hjelpemiddel-ikonet).
• Skriv inn samme kommando som du brukte for å åpne utilman.bat i Recovery Mode.
• Velg Steg 2 i menyen og endre passordet.

6️⃣ Gjenopprett utilman.exe
• Start PC-en tilbake i Recovery Mode.
• Åpne kommandolinje og kjør utilman.bat igjen.
• Velg Steg 3 i menyen for å gjenopprette original utilman.exe.


utilman.bat fil


