#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
Created on 2019-03-31 20:11:39

@author: xujianwen
'''
import subprocess
from serverlogging.serverlog import INFO
class Systemtask():
    
    def __init__(self, client):
        
        self.client = client
            
    def task(self, cmd):
        INFO('[*] Rcv Command:' + str(cmd))
        self.__info = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr = subprocess.PIPE)
        
        results = self.__get_task_results()
        
        self.__send_results(results)
        
    def __get_task_results(self):
        
        stdout, stderr = self.__info.communicate()
        
        if stderr != b'':
            return stderr

        return stdout
        
    
    def __send_results(self, results):
        
        self.client.sendall(results)