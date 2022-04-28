#!/bin/bash

host=$1
port=$2
antall=$3
thr=$4
tester=$5
req=$6
fil="$req/bachelor-applikasjon/python-script-get/output/test2-output-$(date +%s).txt"

mkdir "$req/bachelor-applikasjon/python-script-get/output" || echo ""

echo ""
echo "Syntax: ./test2.sh <host> <port> <antall> <thr> <Antall tester> <filbane til mappe repoet ligger i>"
echo ""




echo "Test 2 er startet med følgende konfig"
echo ""
echo "Host:     $host"
echo "Port:     $port"
echo "Antall:   $antall"
echo "Tråder:   $thr"
echo ""


for i in `seq 1 $tester`
do
echo "Output for test $i:" >> $fil
{ time python3 $req/bachelor-applikasjon/python-script-get/req.py --host $host --port $port --antall $antall --thr $thr; } 2>> $fil
echo "" >> $fil
echo "Test $i gjennomført. Venter 30 sekunder før neste test..."
sleep 30
done

echo ""
echo ""
echo "Test 2 ferdig. Output ligger i:"
echo "$fil"