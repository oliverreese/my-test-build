# my-test-build

###Wichtige Bestandteile:
1. .npmrc
2. package.json
3. Dockerfile
4. Github Token mit Rechten auf die Dependency


####1. .npmrc

Einträge in .npmrc. Erste Zeile für package.json womit der @tag aufgelöst werden soll,
Zweite Zeile dient zur Authentifizerung per GithubToken

```
@oliverreese:registry=https://npm.pkg.github.com/oliverreese
//npm.pkg.github.com/:_authToken=${NPM_TOKEN}
```

####2. package.json


Eintrag der Dependency. Wie der Name im package.json der Abhängigkeit.
```
  "dependencies": {
    "express": "^4.17.1",
    "@oliverreese/my-private-dependency": "1.3.0"
  }
```

####3. Dockerfile

Im Dockerfile wird das Argument NPM_TOKEN welches beim Build angegeben werden muss durchgereicht.

```
ARG NPM_TOKEN
```

######Bauen und starten des Containers:

```
docker build --build-arg NPM_TOKEN=${GitHubToken} -t oliverreese/my-test-build .

docker run -p 8000:8080 -d oliverreese/my-test-build
```
