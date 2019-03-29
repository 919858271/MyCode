#!/usr/bin/env python
# -*- coding: utf-8 -*-
import time
import socketserver
g_conn_pool = dict()

class Tcpserver(socketserver.BaseRequestHandler):

    def setup(self):
        self.connected = self.set_connected()
        if self.connected:
            self.request.sendall('ACK'.encode('utf8'))
            print('[*] Total %d connected clients' % len(g_conn_pool))
            return

        self.request.sendall('NACK'.encode('utf8'))

    def handle(self):
        while self.connected:
            try:

                self.rcv_cmd = self.request.recv(1024).decode('utf-8')

                if len(self.rcv_cmd) == 0:
                    self.remove()
                    break

                elif str(self.rcv_cmd)== 'E':
                    self.remove('task done')
                    break
                    
                self.request.sendall(self.rcv_cmd.encode('utf8'))
                
            except ConnectionResetError as e:
                self.remove(e)
                break

    def remove(self, info='rcv empty data'):
        print(u"[*] client %s off line as %s."%(self.client_address[0], str(info)))
        g_conn_pool.pop(self.client_address[0])
        print('[*] Total %d connected clients' % len(g_conn_pool))

    def set_connected(self):
        if not self.client_address[0] in g_conn_pool.keys():
           g_conn_pool[self.client_address[0]] = True
           return True

        return False


if __name__ == "__main__":

    host, port = "127.0.0.1", 999
    server = socketserver.ThreadingTCPServer((host, port), Tcpserver)   # 多线程
    #server=socketserver.ForkingTCPServer((host, port),Tcpserver) # 多进程 linux only
    #server.max_children = 2 # 多进程
 
    print("[*] listening on %s:%d"%(host, port))
    server.serve_forever()
