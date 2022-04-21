# Python get script

Python script som sender X get forespørsler.

Per nå så må forespørselen gi 200 tilbake for at testen skal gå vidre

## Howto:

```
python3 req.py --host <IP> --port <PORT> --antall <antall>

Eks:
python3 req.py --host 192.168.72.2 --port 30001 --antall 1000
```

`antall` er hvor mange get forespørsler som skal returnere 200 før vi godkjenner tester.

