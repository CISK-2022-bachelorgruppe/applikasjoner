# Setup for mysql-applikasjon
For å kjøre sched-applikasjonen må applikasjonen bygges og legges i minikube.

Åpne en terminal i denne mappen

Bruk minikube sin docker for å lagre imaget i minikube noden
```shell
eval $(minikube docker-env)
```

Bygg applikasjonen med minikube sin docker.
```shell
docker build -t sched .
```