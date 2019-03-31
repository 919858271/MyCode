#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-03-30 19:26:17

@author: jianwen

'''
from config import SERVER
from taskclient.tcpclient import Tcpclient


if __name__ == '__main__':
    client = Tcpclient(SERVER)
    client.forever()
