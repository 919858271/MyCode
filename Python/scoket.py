#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
import logging
import socketserver
import logging.handlers
from logging import Formatter
from os.path import getsize
from os.path import basename
from json import dumps
from json import loads
from hashlib import md5

ADDRESS = ('127.0.0.1', 8712)

def loghandler():
    datefmt = '%Y-%m-%d %H:%M:%S'
    fmt = '%(asctime)s %(levelname)s %(message)s'
    console = logging.StreamHandler()
    console.setFormatter(Formatter(fmt=fmt, datefmt=datefmt))
    fileHandler = logging.handlers.RotatingFileHandler('log.log', maxBytes=10*1024*1024, backupCount=1)
    fileHandler.setFormatter(Formatter(fmt=fmt, datefmt=datefmt))

    logger = logging.getLogger(__name__)
    logger.addHandler(fileHandler)
    logger.setLevel(logging.DEBUG)
    logger.addHandler(console)
    return logger
    
def send_file(socket, file_path):
    filename = basename(file_path)
    filesize = getsize(file_path)
    hash = md5()

    with open(file_path, 'rb') as f:
        filedata = f.read()
        hash.update(filedata)
        fileinfo = dumps({'filename': filename, 'filesize': filesize, 'md5': hash.hexdigest()})
        socket.sendall(fileinfo.encode('utf8'))
        socket.sendall(filedata)

def recv_file(socket, save_path=None):
    buffsize=1024
    recved_len = 0
    fileinfo = client.recv(1024).decode('utf8')
    fileinfo = loads(fileinfo)
    filesize = fileinfo['filesize']
    filename = fileinfo['filename']
    hash = md5()
    with open(filename, 'wb') as f:
        while recved_len < fileinfo['filesize']:
            unrecv_len = filesize - recved_len
            buffsize = buffsize if unrecv_len > buffsize else unrecv_len
            filedata = client.recv(buffsize)
            hash.update(filedata)
            f.write(filedata)
            recved_len += len(filedata)
    return hash.hexdigest() == fileinfo['md5']

class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):

    def setup(self):
        self.request.sendall('ACK'.encode('utf8'))
        logger.info(u"%s 接入" % self.client_address[0])

    def handle(self):
        try:
            config = self.request.recv(1024)
            logger.info(u"%s 请求 %s 配置信息" % (self.client_address[0], str(config)))
            f = r'filepath'
            send_file(self.request, f)
        except:
            return

    def finish(self):
        pass

class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    pass

if __name__ == '__main__':
    logger = loghandler()
    server = ThreadedTCPServer(ADDRESS, ThreadedTCPRequestHandler)
    logger.info(u'xx服务')
    server.serve_forever()

