#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
Created on 2019-05-16 23:18:15

@author: xujianwen
'''
import logging

datefmt = '%Y-%m-%d %H:%M:%S'
fmt = '[*]%(asctime)s - %(threadName)s - %(levelname)s - %(message)s'

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

# 自定义日志Handler来接收日志数据
class QtLogHandler(logging.Handler):
    
    def __init__(self, signal):
        super().__init__()
        self.signal = signal
        self.setFormatter(logging.Formatter(fmt=fmt, datefmt=datefmt))
        
    def emit(self, record):
        self.signal.emit(self.format(record))



