echo "Skriptet vil lagre loggfiler m.m i denne mappen: $(pwd)"
echo '(Husk at appen "sched" må bygges å legges inn i minikube før denne testen startes)'
echo

echo "Starter skriptet om 10 sekunder"
sleep 10
arbeidsmappe="./resultater/"            # I denne mappen lagres resultatene fra testen
Fil_slettingAvPodLOG=""$arbeidsmappe"slettede-podder-[$(date +%F"_"%H%M%S)].txt"
Fil_error=""$arbeidsmappe"error.log"
mkdir $arbeidsmappe 2>> /dev/null        # Arbeidsmappen opprettes
touch $Fil_slettingAvPodLOG             # Loggfil opprettes
touch $Fil_error

Filnavn_sched=sched-deployment.yaml
wget https://raw.githubusercontent.com/sonjoh/k8s-bachelor/b8b3beb0b5a6805bc43aa3f92f2dbb3fd31b99b0/k8s-config/sched/sched-deployment.yaml -O $Filnavn_sched 2>> "$Fil_error"   # Laster ned sched-deployment
nmcli radio wifi off                    # Skrur av WiFi

echo """
-------------------
|  Skrur av WiFi  |
-------------------
"""
sleep 5

echo
echo "Sched-applikasjonen deployeres nå!"
minikube kubectl --  apply -f $Filnavn_sched         # Starter schedule-appen

echo
echo "Venter i 2 minutter før første pod slettes"
sleep 120
for i in {1..30}                        # Her starter selve testen
do
    POD_django=$(minikube kubectl --  get pod -l app=django -o jsonpath="{.items[0].metadata.name}")
    echo
    echo "Sletter pod: $i:  $POD_django"
    echo "Slettet pod: $i:  $POD_django" >> "$Fil_slettingAvPodLOG"
    minikube kubectl --  delete pod $POD_django --force 2>> "$Fil_slettingAvPodLOG"
    sleep 30
done

minikube kubectl --  delete -f $Filnavn_sched        # Sletter sched-applikasjon så det ikke kommer flere database-entries
rm $Filnavn_sched
echo "Ferdig med testing. Venter i 30 sekunder"
sleep 30

echo "Eksporterer databasen fra podden mysql"

POD_mysql=$(minikube kubectl --  get pod -l app=mysql -o jsonpath="{.items[0].metadata.name}")
MYSQL_secure_file_priv="/var/lib/mysql-files/"
Filnavn_db="bachelor_db-[$(date +%F"_"%H%M%S)].csv"
Fil_db=$MYSQL_secure_file_priv$Filnavn_db

minikube kubectl --  exec $POD_mysql -- mysql -uroot -pcGFzc3dvcmQK --execute="SELECT * FROM bachelor_db.api_appdb INTO OUTFILE '$Fil_db' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" 2>> "$Fil_slettingAvPodLOG"     # Eksporterer database fra mysql-pod og konverterer det til csv


minikube kubectl --  cp default/$POD_mysql:$Fil_db "$arbeidsmappe$Filnavn_db" 2>> "$Fil_slettingAvPodLOG"                               # Kopierer csv-filen fra podden til host-maskinen

sed -i '1s/^/"ID";"Tidspunkt";"Tid siden siste";"Tid";"Podnavn"\n/' "$arbeidsmappe$Filnavn_db"  # Legger til overskrifter i csv-filen
