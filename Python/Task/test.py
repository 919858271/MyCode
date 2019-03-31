#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-03-30 20:48:30

@author: jianwen

'''
import time
import subprocess

cmd = "cd .. && cd Task && git diff && git status"

info = subprocess.Popen(cmd,shell=True, stdout=subprocess.PIPE, stderr = subprocess.PIPE)
stdout, stderr = info.communicate()
print(info.poll())
print(info.pid)
print(stdout.decode())
print(stderr)


