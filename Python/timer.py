#!/usr/bin/env python
# _*_coding:utf-8_*_
import time
from threading import Timer

import subprocess
 
#cmd = 'your command'
#res = subprocess.call(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


class LoopTimer(Timer):
    def __init__(self, interval, function, args=[], kwargs={}):
        Timer.__init__(self, interval, function, args, kwargs)

    def run(self):
        while True:
            self.function(*self.args, **self.kwargs) # 启动就运行
            self.finished.wait(self.interval)
            if self.finished.is_set():
                self.finished.set()
                break
                
def f1():
    print('当前时间:{}'.format( time.strftime( '%Y-%m-%d %H:%M:%S',time.localtime(time.time()))  ))
 
LoopTimer(1, f1).start()
