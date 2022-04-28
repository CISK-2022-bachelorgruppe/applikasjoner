#!/usr/bin/env python

from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import os

#Create custom HTTPRequestHandler class
class KodeFunHTTPRequestHandler(BaseHTTPRequestHandler):

    #handle GET command
    def do_GET(self):
        value = 0
        for i in range(1, 50000):
            value += 1
            value = value * i



def run():
   print('http server is starting...')

#ip and port of servr
#by default http server port is 80
server_address = ('127.0.0.1', 80)
httpd = HTTPServer(server_address, KodeFunHTTPRequestHandler)
print('http server is running...')
httpd.serve_forever()

if __name__ == '__main__':
    run()