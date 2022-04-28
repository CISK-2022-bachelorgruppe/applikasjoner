import requests
import argparse
import threading
from threading import Thread
threadLock = threading.Lock()


parser = argparse.ArgumentParser()
parser.add_argument('--host', nargs='?', const=1, type=str)
parser.add_argument('--port', nargs='?', const=1, type=int)
parser.add_argument('--antall', nargs='?', const=1, type=int)
parser.add_argument('--thr', nargs='?', const=1, type=int)
args = parser.parse_args()
print(f"\nStarter test mot http://{args.host}:{args.port}\n\n")

def foresporsel(host, port, antall, thr):
    global value
    
    while value < antall-thr:
        r = requests.get(f"http://{host}:{port}")
        if r.status_code == 200:
            with threadLock:
                value += 1
            if value % 50 == 0:
                print(f"Det er gjennomført {value}/{antall} tester.")



value = 0

threads = []
for i in range(args.thr):
    t = threading.Thread(target=foresporsel, args=(args.host, args.port, args.antall, args.thr))
    threads.append(t)
    t.start()

for i in range(args.thr):
    for tråd in threads:
            tråd.join()

if args.thr != 0:
    while value < args.antall:
        r = requests.get(f"http://{args.host}:{args.port}")
        if r.status_code == 200:
            with threadLock:
                value += 1
            if value % 50 == 0:
                print(f"Det er gjennomført {value}/{args.antall} tester.")
