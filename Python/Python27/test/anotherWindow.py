# -*- coding:utf-8 -*-

from PyQt4.QtGui import QMainWindow

class AnotherWindow(QMainWindow):
    def __init__(self):
        super(AnotherWindow, self).__init__()
        self.resize(400, 300)
        self.setWindowTitle("this is another window")