Utført på to maskiner; én som hoster minikiube og én som kjører test-gjennomføring.sh

Kommando kjørt på Maskin B (den som sender forespørsler)
```
./test-gjennomføring.sj 10.0.0.2 8000 150 10 $HOME/git <brukernavn til Maskin A>
```

> Merk: For at scriptet skal fungere må Maskin B legge inn sin public key i Maskin As ~/.ssh/authorized_keys
> Django kjørte med tag :6.0 som vil si at det krevde mye mindre prossessering per forespørsel.