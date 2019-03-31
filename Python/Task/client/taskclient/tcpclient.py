#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-03-30 19:27:12

@author: jianwen

'''
import socket


class Tcpclient():
    def __init__(self, server):
        self.client = socket.socket()
        self.client.connect(server)
        self.connected = True
        if not self.success_connect():
            self.connected = False

    def success_connect(self):
        responses = self.client.recv(1024)
        if responses == 'NACK':
            self.client.close()
            return False
        self.client.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
        return True

    def forever(self):
        while self.connected:
            send_data = input("输入发送内容:")
            self.client.sendall(bytes(send_data, encoding="utf8"))
            if send_data == "byebye":
                break
            accept_data = str(self.client.recv(1024), encoding="gbk")
            print("".join(("接收内容：", accept_data)))
