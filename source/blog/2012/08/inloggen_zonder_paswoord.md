# Inloggen zonder paswoord

Niet altijd is het nodig dat gebruikers over een paswoord beschikken om in een gepersonaliseerde omgeving te werken. We overlopen een oplossing die we recent voor een klant ontwikkelden.

## Situatie

Veel webapplicaties vergen dat de gebruiker inlogt met een eigen paswoord. Logisch natuurlijk, want als gebruiker wil je niet dat een derde wijzigingen kan aanbrengen of handelingen kan uitvoeren in jouw naam.

## Het probleem

Met de beweging van desktop applicaties naar web-gebaseerde toepassingen is de hoeveelheid paswoorden die je als gebruiker nodig hebt geëxplodeerd. Paswoordmanagers en inloggen via bepaalde services als Facebook, Google en Twitter lossen een deel van dit probleem op, maar kennen ook elk hun nadelen.

## Onze oplossing

Voor een klant ontwierpen we een oplossing waarbij vele gebruikers die slechts eenmalig in een applicatie een aantal handelingen moesten uitvoeren (in dit geval leerlingen die een boekenlijst moeten invullen).

De gebruikers ontvangen een e-mail met daarin een gepersonaliseerde veilige link zoals:

http://boekenfonds.school.be/leerlingen/b6e72be89c731f42be9dfd724b37312355a9f9ca

Het laatste gedeelte (b6e72be89c731f42be9dfd724b37312355a9f9ca) is een stukje tekst die een gebruiker identificeert. Als je denkt dat dit niet veilig is, volg even volgende berekening mee.

<script src="https://gist.github.com/3525993.js?file=hash_mogelijkheden.rb"></script>
