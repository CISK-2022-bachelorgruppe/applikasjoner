import requests
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--host', nargs='?', const=1, type=str)
parser.add_argument('--port', nargs='?', const=1, type=int)
parser.add_argument('--antall', nargs='?', const=1, type=int)
args = parser.parse_args()
print(f"\nStarter test mot http://{args.host}:{args.port}\n\n")

x = 0

while x < args.antall:
    r = requests.get(f"http://{args.host}:{args.port}")
    if r.status_code == 200:
        x += 1
        if x % 1000 == 0:
            print(f"Det er gjennomført {x}/{args.antall} tester.")
