#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-01-23 19:06:29

@author: jianwen

'''

import socket
from log import client_log


class TCPClient():
    
    @client_log.info
    def __init__(self,host,port):
        self.host = host
        self.port = port
        self.__start_client()
        
    @client_log.info
    def __get_connected(self):
        self.__tcp_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.__tcp_client.connect((self.host, self.port))

    @client_log.info
    def __send_msg(self,msgs):
        self.__tcp_client.send(msgs)
        response = self.__tcp_client.recv(4096)
        print(response.decode('utf-8'))
        self.__tcp_client.close()
      
    @client_log.info
    def __start_client(self, connected=True):
        while connected:
            cmd = input(u'请输入命令[q2exit]:')
            if 'q'==cmd:
                connected = False
                return
            self.__get_connected()
            self.__send_msg(cmd.encode('utf-8'))
        else:
            print('Done')
