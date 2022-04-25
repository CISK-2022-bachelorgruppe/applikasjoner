# Python get script

Python script som sender X get forespørsler.

Per nå så må forespørselen gi 200 tilbake for at testen skal gå vidre

## Howto:

```
python3 req.py --host $(minikube ip) --port <PORT> --antall <antall forespørsler> --thr <antall tråder>

Eks:
python3 req.py --host $(minikube ip) --port 30001 --antall 1000 --thr 10
```

- `antall` er hvor mange get forespørsler som skal returnere 200 før vi godkjenner tester.
- `thr` er hvor mange tråder du vil ha
- `host` er IP-adresse/URL <b>UTEN</b> `http://`

