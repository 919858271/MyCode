#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-03-30 19:32:32

@author: jianwen

'''
import sys

from config import SERVER
from serverlogging.serverlog import INFO
from taskserver.tcpserver import Tcpserver


if __name__ == "__main__":
    if sys.version_info.major >= 3:
        from socketserver import ThreadingTCPServer
    else:
        from SocketServer import ThreadingTCPServer
    server = ThreadingTCPServer(SERVER, Tcpserver)
    INFO("[*] Listening on %s:%d" % SERVER)
    server.serve_forever()
