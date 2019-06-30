#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
Created on 2019-05-12 16:09:14

@author: xujianwen
'''

import logging
try:
    from colorlog import ColoredFormatter as Formatter
    fmt = "%(log_color)s%(asctime)s %(log_color)s%(levelname)s %(log_color)s%(message)s"
except:
    from logging import Formatter
    fmt = '%(asctime)s %(levelname)s %(message)s'
   
datefmt = '%Y-%m-%d %H:%M:%S'
console = logging.StreamHandler()
console.setFormatter(Formatter(fmt=fmt, datefmt=datefmt))

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
logger.addHandler(console)

