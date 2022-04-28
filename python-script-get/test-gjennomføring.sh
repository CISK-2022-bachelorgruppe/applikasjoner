#!/bin/bash

host=$1
port=$2
foresporsler=$3

gjennomforinger=$4
path=$5
tid=$(date +%s)


if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ]
then
echo "Hvor mange podder kjøres?:"
read podder

mkdir "$path/bachelor-applikasjon/python-script-get/output"

for z in {1..10}
do
fil="$path/bachelor-applikasjon/python-script-get/output/$podder-podder.$z-trader-$tid.txt"
echo "Starter med $z tråder og $podder podder."
for i in $(seq 1 $gjennomforinger)
do
/usr/bin/time -a -o "$fil" -f "%E" nice bash -c "python3 $path/bachelor-applikasjon/python-script-get/req.py --host $host --port $port --antall $foresporsler --thr $z"

if [ $i != $gjennomforinger ]; then
echo "Gjennomføring $i gjennomført. Venter 5 sekunder før neste test..."
sleep 5
else
echo "Test med $z tråder ferdig!"
fi
done
sleep 2
done



else
echo ""
echo "ERROR: Ikke riktig argumenter"
echo ""
echo "Riktig syntax: ./test-gjennomføring.sh <host> <port> <forespørsler> <antall gjennomføringer> <path repo ligger i>"
echo ""
echo "Eksempel: ./test-gjennomføring.sh \$(minikube ip) 30001 100 2 5 $HOME/git"
echo ""
fi