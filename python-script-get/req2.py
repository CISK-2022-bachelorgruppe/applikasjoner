import requests
import argparse
import threading
#from threading import Thread
#threadLock = threading.Lock()


parser = argparse.ArgumentParser()
parser.add_argument('--host', nargs='?', const=1, type=str)
parser.add_argument('--port', nargs='?', const=1, type=int)
parser.add_argument('--antall', nargs='?', const=1, type=int)
parser.add_argument('--thr', nargs='?', const=1, type=int)
args = parser.parse_args()
print(f"\nStarter test mot http://{args.host}:{args.port}\n\n")

#def foresporsel(host, port, antall, thr):
#    global value
#    
#    while value < antall-thr:
#        r = requests.get(f"http://{host}:{port}")
#        if r.status_code == 200:
#            value += 1
#            if value % 1000 == 0:
#                print(f"Det er gjennomført {value}/{antall} tester.")



value = 0

while value < args.antall:
    r = requests.get(f"http://{args.host}:{args.port}")
    if r.status_code == 200:
        value += 1
        if value % 100 == 0:
            print(f"Det er gjennomført {value}/{args.antall} tester.")
