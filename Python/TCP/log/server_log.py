#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2019-01-23 21:01:38

@author: jianwen

'''

import logging
import os
filename='server_log.log'
DATE_FORMAT = "%Y/%m/%d %H:%M:%S"
log_format = '%(asctime)s - %(levelname)s - Thread[%(thread)d] - %(message)s'
logging.basicConfig(level = logging.DEBUG,format = log_format, filename = filename, datefmt=DATE_FORMAT, filemode='w')

def debug(func):
    def wrapper(*args, **kw):   
        file_name = os.path.basename(func.__code__.co_filename)
        fun_name = func.__name__
        fun_at_line = func.__code__.co_firstlineno
    
        start_info = 'function %s() in file:%s @lineno %d runing.' % (fun_name, file_name, fun_at_line)        
        logging.debug(start_info)
        result = func(*args, **kw)
        end_info = 'function %s() in file:%s @lineno %d done.' % (fun_name, file_name, fun_at_line)    
        logging.debug(end_info)
        return result
    return wrapper

def info(func):
    def wrapper(*args, **kw):   
        file_name = os.path.basename(func.__code__.co_filename)
        fun_name = func.__name__
        fun_at_line = func.__code__.co_firstlineno
    
        start_info = 'function %s() in file:%s @lineno %d runing.' % (fun_name, file_name, fun_at_line)        
        logging.info(start_info)
        result = func(*args, **kw)
        end_info = 'function %s() in file:%s @lineno %d done.' % (fun_name, file_name, fun_at_line)    
        logging.info(end_info)
        return result
    return wrapper


       
        
