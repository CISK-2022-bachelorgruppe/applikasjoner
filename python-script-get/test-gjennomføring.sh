#!/bin/bash

host=$1
port=$2
foresporsler=$3
gjennomforinger=$4
path=$5
username=$6
remoteGit=$7
tid=$(date +%s)


if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ] && [ $6 ] && [ $7 ]
then
    echo "velkommen til"


    mkdir "$path/bachelor-applikasjon/python-script-get/output"
    mkdir "$path/bachelor-applikasjon/python-script-get/output/$tid"

    for pod in {1..10}
    do
        ssh $username@$host "cd $remoteGit/k8s-bachelor/k8s-config/django/ && kubectl scale --replicas=$pod -f django-deployment.yaml"
        sleep 12

        for z in {1..10}
        do
            fil="$path/bachelor-applikasjon/python-script-get/output/$tid/$pod-podder.$z-trader-$tid.txt"
            echo "Starter med $z tråder og $pod podder."
            for i in $(seq 1 $gjennomforinger)
            do
                /usr/bin/time -a -o "$fil" -f "%E" nice bash -c "python3 $path/bachelor-applikasjon/python-script-get/req.py --host $host --port $port --antall $foresporsler --thr $z"
                
                if [ $i != 10 ]; then
                    echo "Gjennomføring $i gjennomført. Venter 5 sekunder før neste test..."
                    echo ""
                    sleep 12
                else
                    echo "Test med $z tråd(er) ferdig!"
                    echo ""
                fi
            done
        done
        echo "Test med $pod podder ferdig, skalerer opp."
        echo ""
    done



else
    echo ""
    echo "ERROR: Ikke riktig argumenter"
    echo ""
    echo "Riktig syntax: ./test-gjennomføring.sh <host> <port> <forespørsler> <antall gjennomføringer> <path repo ligger i> <username> <path repo ligger i på remote maskin>"
    echo ""
    echo "Eksempel: ./test-gjennomføring.sh \$(minikube ip) 30001 100 2 $HOME/git bruker1 /home/bruker2/Git_Repo"
    echo ""
fi