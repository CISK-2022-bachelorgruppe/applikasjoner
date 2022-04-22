kubectl apply -f https://raw.githubusercontent.com/sonjoh/k8s-bachelor/b8b3beb0b5a6805bc43aa3f92f2dbb3fd31b99b0/k8s-config/sched/sched-deployment.yaml
sleep 120
for i in {1..30}
do
    POD=$(kubectl get pod -l app=django -o jsonpath="{.items[0].metadata.name}")
    kubectl delete pod $POD --force 
    echo "Slettet pod: $i:  $POD" >> log.txt
    echo Kjøring: $i
    sleep 30
done
echo "FERDIG"