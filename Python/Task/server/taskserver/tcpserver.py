#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-03-30 19:27:12

@author: jianwen

'''

import sys
from backend.sharememory import g_connected_pool
from serverlogging.serverlog import INFO
from backend.systemtask import Systemtask as Task

if sys.version_info.major >= 3:
    import socketserver as socketserver
else:
    import SocketServer as socketserver


class Tcpserver(socketserver.BaseRequestHandler):

    def setup(self):
        self.connected = self.set_connected()
        if self.connected:
            self.request.sendall('ACK'.encode('utf8'))
            INFO('[*] Total %d connected clients' % len(g_connected_pool))
            return
        
        
        self.request.sendall('NACK'.encode('utf8'))
        

    def handle(self):
        self.task = Task(self.request)
        while self.connected:
            try:

                rcv_cmd = self.request.recv(1024).decode('utf-8')
                
                if self.check_connect_status(rcv_cmd):
                    break
#                 INFO(str(rcv_cmd))
                self.task.task(rcv_cmd)
#                 self.request.sendall(rcv_cmd.encode('utf8'))
            except ConnectionResetError as e:
                INFO(str(e))
                self.remove()
                break

    def check_connect_status(self, cmd):
        if len(cmd) == 0 or str(cmd) == 'E':
            self.remove()
            self.request.close()
            return True
        return False

    def remove(self):
        INFO(u"[*] Client %s off line." % self.client_address[0])
        g_connected_pool.pop(self.client_address[0])

    def set_connected(self):
        if not self.client_address[0] in g_connected_pool.keys():
            g_connected_pool[self.client_address[0]] = True
            return True

        return False
