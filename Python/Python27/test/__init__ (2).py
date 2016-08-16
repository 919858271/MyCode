# -*- coding: utf-8 -*-

import numpy as np
import scipy as sp
import matplotlib.pyplot as plt
import ctypes    
from scipy.integrate import odeint
from mpl_toolkits.mplot3d import Axes3D
import sys
from PyQt4 import QtGui
from PyQt4 import QtCore
from matplotlibwidget import MatplotlibWidget

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

def lorenz(w, t, p, r, b):  
                x, y, z = w
                return np.array([p*(y-x), x*(r-z)-y, x*y-b*z])
            
           
class myPlot(QtGui.QWidget):
    def plots(self, parent = None,data=None):
        super(myPlot, self).__init__(parent)
        #self.setGeometry(100, 80, 420, 350)
        self.mplwidget = MatplotlibWidget(self)
        
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.mplwidget.sizePolicy().hasHeightForWidth())
        self.mplwidget.setSizePolicy(sizePolicy)
        
        #self.mplwidget.setGeometry(QtCore.QRect(0, 30, 400, 300))
        self.ax=Axes3D(self.mplwidget.figure) 
        self.ax.plot(data[:,0], data[:,1],data[:,2])
        self.ax.set_xlabel("x")
        self.ax.set_ylabel("y")
        self.ax.set_zlabel("z")
        self.show()
        
class CheckBoxExample(QtGui.QWidget):

    def __init__(self):
        super(CheckBoxExample, self).__init__()
      
        
        self.setGeometry(300, 80, 850, 750)
        
        self.OK = QtGui.QPushButton("OK",self)
        self.OK.setGeometry(QtCore.QRect(140, 490, 75, 23))
    
        self.Cancel = QtGui.QPushButton("Cancel",self)
        self.Cancel.setGeometry(QtCore.QRect(340, 490, 75, 23))
        
        
        
        
        self.OK.clicked.connect(self.OK_Clicked)
        self.Cancel.clicked.connect(self.Cancel_Clicked)
    def Cancel_Clicked(self):
        #self.neww=HelloPyQt()
        #self.neww.show()
        sys.exit(0)
    def OK_Clicked(self):      
        mpl=myPlot()
        t = np.arange(0, 30, 0.01)
        track1 = odeint(lorenz, (0.0, 1.00, 0.0), t, args=(10.0, 28.0, 3.0))    
        mpl.plots(self,track1)
        
        
if __name__ == '__main__':

    app = QtGui.QApplication(sys.argv)
    ex = CheckBoxExample()
    ex.show()
    app.exec_()