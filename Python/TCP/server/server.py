#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-01-23 19:06:38

@author: jianwen

'''

import socket
import threading
from log import server_log

class TCPServer():
    
    @server_log.info
    def __init__(self):
        self.__get_local_host()
        self.__bind_host()
        self.__start_server()
        
    @server_log.info    
    def __get_local_host(self):    
        self.__server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.__server.connect(('8.8.8.8', 80))
        self.__host = self.__server.getsockname()
        self.__server.close()
    
    @server_log.info
    def __bind_host(self):    
        self.__server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.__server.bind(self.__host)
        self.__server.listen(5)
        print('[*] Listening on: %s:%d'% self.__host)
    
    @server_log.info
    def __start_server(self):
        while True:
            client, addr = self.__server.accept()
            print('[*] Accpted connection from: %s:%d'% (addr[0],addr[1]))
            client_handler = threading.Thread(target=self.__handel_client, args=(client,))
            client_handler.start()
    
    @server_log.info
    def __handel_client(self,client):
        request = client.recv(1024)
        print(request.decode('utf-8'))
        client.send('True'.encode('utf-8'))
        client.close()
        