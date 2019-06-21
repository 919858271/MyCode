#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import logging.config
import logging.handlers
try:
    from colorlog import ColoredFormatter as Formatter
    console_fmt = "%(log_color)s%(asctime)s - %(log_color)s%(levelname)s - %(log_color)s%(message)s"
except ImportError:
    from logging import Formatter as Formatter
    console_fmt = "%(asctime)s - %(levelname)s - %(message)s"
    
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
    
backupCount = 1
maxBytes = 10485760
filefmt = "%(asctime)s - %(levelname)s - %(message)s"
datefmt = "%Y-%m-%d %H:%M:%S"


console = logging.StreamHandler()
console.setLevel(logging.DEBUG)
console.setFormatter(Formatter(fmt=console_fmt, datefmt=datefmt))

filer = logging.handlers.RotatingFileHandler('app.log', maxBytes=maxBytes, backupCount=backupCount)
filer.setLevel(logging.DEBUG)
filer.setFormatter(logging.Formatter(fmt=filefmt, datefmt=datefmt))

logger.addHandler(filer)
logger.addHandler(console)

class QtHandler(logging.Handler):
    color_log = {
        'INFO':    '<font size="4" color="ForestGreen">{msg}</font>',
        'DEBUG':   '<font size="4" color="MediumBlue">{msg}</font>',
        'WARNING': '<font size="4" color="OrangeRed">{msg}</font>',
        'ERROR':   '<font size="4" color="Magenta">{msg}</font>',
        'CRITICAL':'<font size="4" color="DarkRed">{msg}</font>',
    }
    def __init__(self, signal):
        super().__init__()
        self.signal = signal
        self.setFormatter(logging.Formatter(fmt=fmt, datefmt=datefmt))
        self.setLevel(logging.INFO)
        
    def emit(self, record):
        msg = self.format(record)
        color_msg = self.color_log.get(record.levelname, None)
        if color_msg is not None:
            msg = color_msg.format(msg = msg)
        self.signal.emit(msg)
        
if __name__ == "__main__":
    logger.info('test')
    logger.warning('test') 
    logger.error('test')
    logger.critical('test')
    logger.debug('test') 

 
