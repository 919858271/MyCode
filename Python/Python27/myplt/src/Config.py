# -*- coding: utf-8 -*-
'''
Created on 2016-08-09 14:36:11

@author: jianwenxu
'''
from configobj import ConfigObj

def readConfig(path):
    return ConfigObj(path,encoding='UTF-8')

def writeConfig(path,item,setting,setConfig):
    config = ConfigObj(path,encoding='UTF8')  
    if config.has_key(item):      
        config[item][setting] = setConfig
    else:
        config[item] = {}
        config[item][setting] = setConfig
    config.write()
