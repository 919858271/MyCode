# -*- coding: utf-8 -*-
'''
Created on 2016-08-09 14:36:11

@author: jianwenxu
'''
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from mpl_toolkits.mplot3d import Axes3D
from PyQt4 import QtCore, QtGui
import Config as cf


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


configPath = "Config/default.ini"

class myfun():
    def __init__(self,funName):      
        self.funs = []
        #conf=cf.readConfig(configPath)
        self.sysVars=list(confs[funName])
        lens=len(self.sysVars)
        global funStr
        funStr=""
        for i in range(lens):
            self.funs.append(confs[funName][self.sysVars[i]])
            funStr+="d"+self.sysVars[i]+"/dt="+confs[funName][self.sysVars[i]]+"\n"  
    def FUN(self,w, t):    
        lens=len(self.sysVars)
        scope={}
        data=[]
        for i in range(lens):
            scope[str(self.sysVars[i])]=float(w[i])       
        for i in range(lens):
            data.append(eval(self.funs[i],scope))   
        return np.array(data)
    
class Ui_MainForm(QtGui.QMainWindow):
    def __init__(self):
        super(Ui_MainForm, self).__init__()
        self.setGeometry(100,80,985, 644)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8("6.jpg")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.setWindowIcon(icon)
        
        self.statusBar()
        menuBar = self.menuBar()
        self.fileMenu = menuBar.addMenu('&File')

        start=self.fileMenu.addAction(_fromUtf8("开始"))
        existSys=self.fileMenu.addAction(_fromUtf8("退出"))
        
        start.triggered.connect(self.start)
        existSys.triggered.connect(self.close)
    
        self.groupBox = QtGui.QGroupBox(self)
        self.groupBox.setGeometry(QtCore.QRect(20, 40, 451, 601))
        self.groupBox.setObjectName(_fromUtf8("groupBox"))
        self.groupBox_2 = QtGui.QGroupBox(self.groupBox)
        self.groupBox_2.setGeometry(QtCore.QRect(10, 50, 431, 101))
        self.groupBox_2.setObjectName(_fromUtf8("groupBox_2"))
        
        self.groupBox_3 = QtGui.QGroupBox(self.groupBox)
        self.groupBox_3.setGeometry(QtCore.QRect(10, 180, 431, 401))
        self.groupBox_3.setObjectName(_fromUtf8("groupBox_3"))
        
        self.systemSelect = QtGui.QComboBox(self.groupBox_2)
        self.systemSelect.setGeometry(QtCore.QRect(10, 20, 69, 22))
        self.systemSelect.setObjectName(_fromUtf8("systemSelect"))
        self.systemSelect.addItem(_fromUtf8(""))
        self.systemSelect.setItemText(0, _translate("MainForm","请选择", None))
        
        
        self.funlable=QtGui.QLabel(self.groupBox_3)
        self.funlable.setGeometry(10,20,145,40)
        self.funlable.show()
        
        self.retranslateUi()
        self.systemSelect.currentIndexChanged.connect(self.operate)
       
    def retranslateUi(self):
        self.setWindowTitle(_translate("MainForm", "演示平台", None))
        self.groupBox.setTitle(_translate("MainForm", "控制面板", None))
        self.groupBox_2.setTitle(_translate("MainForm", "系统加载", None))
        self.groupBox_3.setTitle(_translate("MainForm", "系统程式", None))
        self.groupBox.hide()
        self.groupBox_2.hide()
        self.groupBox_3.hide()
        
    def start(self):
        self.groupBox.show()
        self.groupBox_2.show()
        self.groupBox_3.show()
        global confs
        confs=cf.readConfig(configPath)
        sectionList=list(confs)
        if len(sectionList)!=0:
            itemList=list(confs[sectionList[0]])
            lens=len(confs[sectionList[0]])
            for i in range(1,lens+1):  
                self.systemSelect.addItem(_fromUtf8(""))
                self.systemSelect.setItemText(i, _translate("MainForm",
                        confs[sectionList[0]][itemList[i-1]], None))
        else:
            self.mesg=QtGui.QMessageBox("Warning", "None System Load",0, 0, 0,0)
            self.mesg.show()
            
    def operate(self):
            funName=self.systemSelect.currentText()
            if funName!=u'请选择':
                funName=str(funName)
                t = np.arange(0, 100, 0.01) # 创建时间点
                mf=myfun(funName)
                self.funlable.setText(funStr) 
                data = odeint(mf.FUN, (10.0, 1.00, 0.0), t)
                fig = plt.figure(1)
                ax = Axes3D(fig)
                ax.plot(data[:,0], data[:,1], data[:,2])
                ax.set_ylabel('Y')
                ax.set_xlabel('X')
                ax.set_zlabel('Z')
                plt.show()
            else:
                pass
if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    ui = Ui_MainForm()
    ui.show()
    sys.exit(app.exec_())
    
    
    
    
    
    
    
    
    