echo "Skriptet vil lagre loggfiler m.m i denne mappen: $(pwd)"
sched_app=https://raw.githubusercontent.com/sonjoh/k8s-bachelor/b8b3beb0b5a6805bc43aa3f92f2dbb3fd31b99b0/k8s-config/sched/sched-deployment.yaml
kubectl apply -f $sched_app

echo
echo "Venter i 2 minutter før testen starter"
sleep 120
for i in {1..30}
do
    POD_django=$(kubectl get pod -l app=django -o jsonpath="{.items[0].metadata.name}")
    echo
    echo "Sletter pod: $i:  $POD_django"
    echo "Slettet pod: $i:  $POD_django" >> slettede-podder-LOG.txt
    kubectl delete pod $POD_django --force 
    sleep 30
done

kubectl delete -f $sched_app
echo "Ferdig med testing. Venter i 30 sekunder"
sleep 30

echo "Eksporterer databasen fra podden mysql"
POD_mysql=$(kubectl get pod -l app=mysql -o jsonpath="{.items[0].metadata.name}")
Fil="./databasedump/bachelor_db-$(date +%F" "%H%M%S)"
mkdir ./databasedump 2> /dev/null
kubectl exec $POD_mysql -- bash -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" bachelor_db api_appdb' > "$Fil"