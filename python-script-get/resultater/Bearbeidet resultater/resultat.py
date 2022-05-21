import csv

TEST='1651312616'

with open(f'resultater-{TEST}.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['Antall podder', '1 Tråd', '2 Tråder', '3 Tråder', '4 Tråder', '5 Tråder', '6 Tråder', '7 Tråder', '8 Tråder', '9 Tråder', '10 Tråder'])

for pod in range(1,11):
    output = []
    output.append(f'{pod}')
    for thr in range(1, 11):
        with open(f'/home/sj/bachelor-applikasjon/python-script-get/resultater/{TEST}/{pod}-podder.{thr}-trader-{TEST}.txt', 'r') as f:
            print(f"{thr} trader, {pod} podder")
            total = 0.0
            for linje in f:
                total += float(linje.replace('0:', '').replace('\n', ''))
            output.append(round(total/10.0, 2))
    with open(f'resultater-{TEST}.csv', 'a', newline='') as csvfile:
        spamwriter = csv.writer(csvfile, delimiter=',')
        spamwriter.writerow(output)


