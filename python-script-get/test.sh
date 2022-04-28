#!/bin/bash
for i in range {1..10}
do
time python3 /home/sj/bachelor-applikasjon/python-script-get/req2.py --host $(minikube ip) --port 30001 --antall 50 --thr 1&
done
