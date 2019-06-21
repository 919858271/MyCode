#!/usr/bin/env python
# -*- coding: utf-8 -*-

from threading import RLock
from functools import wraps

def singleton(cls):
    instances = {}
    lock = RLock()
    
    @wraps(cls)
    def getinstance(*args, **kw):
        if cls not in instances:
            with lock:
                if cls not in instances:
                    instances[cls] = cls(*args, **kw)
        return instances[cls]
    return getinstance
