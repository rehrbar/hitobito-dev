# Development Setup für Hitobito PBS

Komponenten:

* [Hitobito](https://github.com/hitobito/hitobito)
* [Hitobito Youth](https://github.com/hitobito/hitobito_youth)
* [Hitobito PBS](https://github.com/hitobito/hitobito_pbs)

## Quickstart
Build docker image
```
docker build -t hitobito .
```

Start docker image:
```
docker run -p 3000:3000 -p 8080:1080 -d --name hitobito hitobito
```

Start mailcatcher innerhalb container:
```
docker exec hitobito mailcatcher -f --ip 0.0.0.0
```

Admin User für pbs: `hitobito-pbs@puzzle.ch` (siehe wagon config/settings.yml) -> nutzen der _Passwort Vergessen_ funktion