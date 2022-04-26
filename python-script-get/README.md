# Python get script

Python script som sender X get forespørsler.

Per nå så må forespørselen gi 200 tilbake for at testen skal gå vidre

## OBS: Ny møte å gjennomføre testen
Lagde et scritpt som kjører testen flere ganger.

```
sudo chmod +x ./test2.sh
./test2.sh <HOST> <PORT> <ANTALL FORESPØRSLER> <ANTALL TRÅDER> <ANTALL TESTER> <FILBANE TIL REPOET>

Eksempel:
./test2.sh $(minikube ip) 30001 1000 10 2 $HOME/git
```

Dette scriptet fungerer kun om du har repoet rett på home!

## Howto:

```
python3 req.py --host $(minikube ip) --port <PORT> --antall <antall forespørsler> --thr <antall tråder>

Eks:
python3 req.py --host $(minikube ip) --port 30001 --antall 1000 --thr 10
```

- `antall` er hvor mange get forespørsler som skal returnere 200 før vi godkjenner tester.
- `thr` er hvor mange tråder du vil ha
- `host` er IP-adresse/URL <b>UTEN</b> `http://`

For å teste tid, sleng på time:
```
time python3 req.py --host $(minikube ip) --port <PORT> --antall <ANTALL FORESPØRSLER> --thr <ANTALL TRÅDER>
```

> Etter kort testing på maskin med 4 cores virker det som at 30 er maksantall tråder vi bør gå for. Det virker som at tiden går mye nedover i økning av tråder til en når 10, deretter senkes tiden saktere. Min anbefaling er å kjøre på med 10-20 tråder.
