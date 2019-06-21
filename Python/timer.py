#!/usr/bin/env python
# _*_coding:utf-8_*_
import sys
if sys.version_info.major > 2:
    from threading import Timer as Timer
else:
    from threading import _Timer as Timer

class LoopTimer(Timer):
    def __init__(self, interval, 
                 function, args=[], kwargs={}):
        Timer.__init__(self, interval, function, args, kwargs)

    def run(self):
        while True:
            self.function(*self.args, **self.kwargs)
            self.finished.wait(self.interval)
            if self.finished.is_set():
                self.finished.set()
                break

