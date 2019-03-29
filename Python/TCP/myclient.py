#!/usr/bin/env python
# -*- coding: utf-8 -*-
import socket


sk = socket.socket()
sk.connect(("127.0.0.1", 999)) # 主动初始化与服务器端的连接
accept_data = str(sk.recv(1024), encoding="utf8")
if accept_data=='NACK':
    print('You have connected')
    sk.close()
else:
    sk.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1) #开启心跳维护
    print("".join(("接收内容：", accept_data)))
    while True:
        send_data = input("输入发送内容:")
        sk.sendall(bytes(send_data, encoding="utf8"))
        if send_data == "byebye":
            break
        accept_data = str(sk.recv(1024), encoding="utf8")
        print("".join(("接收内容：", accept_data)))
    sk.close()
