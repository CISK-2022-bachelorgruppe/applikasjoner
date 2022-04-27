#!/bin/bash

host=$1
port=$2
foresporsler=$3
trader=$4
gjennomforinger=$5
path=$6



if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ] && [ $6 ]
then

fil="$path/bachelor-applikasjon/python-script-get/output/T2-output-$(date +%s).txt"
mkdir "$path/bachelor-applikasjon/python-script-get/output"
echo "Output for test $i:" >> $fil


for i in `seq 1 $gjennomforinger`
do

/usr/bin/time -a -o $fil -f "%E" nice bash -c "python3 $path/bachelor-applikasjon/python-script-get/req.py --host $host --port $port --antall $antall --thr $thr"
echo ""

if [ $i != $gjennomforinger ]; then
echo "Gjennomføring $i gjennomført. Venter 10 sekunder før neste test..."
sleep 10
else
echo "Test 2 Ferdig!"
fi
done



else
echo ""
echo "ERROR: Ikke riktig argumenter"
echo ""
echo "Riktig syntax: ./test-gjennomføring.sh <host> <port> <forespørsler> <antall tråder> <antall gjennomføringer> <path repo ligger i>"
echo ""
echo "Eksempel: ./test-gjennomføring.sh \$(minikube ip) 30001 100 2 5 $HOME/git"
echo ""
fi