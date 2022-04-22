for i in {1..30}
do
    POD=$(kubectl get pod -l app=django -o jsonpath="{.items[0].metadata.name}")
    kubectl delete pod $POD --force 
    echo "Slettet pod: $i:  $POD" >> log.txt
    echo Kjøring: $i
    sleep 45
done
echo "FERDIG"