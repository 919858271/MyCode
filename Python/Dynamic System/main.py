# -*- coding: utf-8 -*-

"""
Module implementing Dynamic System.
"""
import sys
import time
from math import *
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from mpl_toolkits.mplot3d import Axes3D
from PyQt4.QtCore import pyqtSignature
from PyQt4 import QtGui
import config as config

from Ui_MainWindow import Ui_mainWindow


class DynamicSystem(QtGui.QMainWindow, Ui_mainWindow):
    """
    Class documentation goes here.
    """

    def __init__(self, parent=None):
        """
        Constructor

        @param parent reference to the parent widget
        @type QWidget
        """
        self.projectName = 'Dynamic System'
        self.version = '1.0'
        self.myGithub = "https://github.com/919858271"
        self.myEmail = "919858271@qq.com"
        self.school = u'西北工业大学'
        self.school_url = "http://www.nwpu.edu.cn/"
        # 默认配置路径
        self.defaultPath = "config/default.ini"
        QtGui.QMainWindow.__init__(self, parent)
        self.getDefaultConfig(self.defaultPath)
        self.setupUi(self)


######以下为事件函数#########################
    # 下拉框选择
    @pyqtSignature("int")
    def on_systemSelect_currentIndexChanged(self, index):
        """
        选择仿真系统
        """
        getIndex = self.systemSelect.currentIndex()
        if getIndex > 0:
            self.groupBox_2.show()
            systemName = str(self.systemSelect.currentText())
            self.getSystem(systemName)
            self.funLabel.setText(self.funstr)
            self.showParaControl()
            self.lineEdit.setText('0.0')
            self.lineEdit_2.setText('100.0')
            self.lineEdit_3.setText('0.01')
            self.lineEdit_4.setText('')
            self.lineEdit_5.setText('')
            self.lineEdit_6.setText('')
            self.var1_2.show()
            self.var1_3.show()
            if 1 == len(self.selected):
                self.lineEdit_5.hide()
                self.lineEdit_6.hide()
                self.var1_2.hide()
                self.var1_3.hide()
            elif 2 == len(self.selected):
                self.lineEdit_6.hide()
                self.var1_3.hide()

            self.dataExport.hide()
            self.visual.hide()
            self.groupBox_9.hide()
            self.comboBox1.hide()
            self.comboBox2.hide()

            if len(self.selected) == 1:

                self.radioButton3.setChecked(True)

            elif len(self.selected) == 2:

                self.radioButton2.setChecked(True)

            elif len(self.selected) == 3:

                self.radioButton1.setChecked(True)

            self.label_5.setText('')
            self.data = None
        else:
            self.funLabel.setText('')
            self.reload.hide()
            self.groupBox_2.hide()

    # 数据导出
    @pyqtSignature("")
    def on_dataExport_clicked(self):
        """
       导出仿真数据
        """
        size = self.data.shape
        self.label_5.setText(u"当前状态:数据导出中...")
        # 更新组件
        QtGui.QApplication.processEvents()
        ISOTIMEFORMAT = '%Y%m%d%H%M%S'
        filename = 'data/' + \
            time.strftime(ISOTIMEFORMAT, time.localtime()) + '.txt'
        # 开始导出
        try:
            self.outPut = open(filename, 'w')
        except IOError:
            filename = time.strftime(ISOTIMEFORMAT, time.localtime()) + '.txt'
            self.outPut = open(filename, 'w')
            self.outPutData(size)
            self.outPut.close()
            self.label_5.setText(u"当前状态:数据导出完成")
        else:
            self.outPutData(size)
            self.outPut.close()
            self.label_5.setText(u"当前状态:数据导出完成")

    # 开始事件
    @pyqtSignature("")
    def on_start_clicked(self):
        """
        开始仿真
        """
        try:

            self.getParas()

            if self.simuTime[0] >= self.simuTime[1] or self.simuTime[0] < 0 or self.simuTime[1] < 0 or self.simuTime[2] <= 0:
                QtGui.QMessageBox.warning(self, u"系统消息", u"仿真时间参数输入有误,请重新输入")
                self.lineEdit.setText('')
                self.lineEdit_2.setText('')
                self.lineEdit_3.setText('')
            else:
                self.label_5.setText(u"当前状态:求解中...")
                # 更新组件
                QtGui.QApplication.processEvents()
                # 开始求解
                self.mySimulation()
                # 求解完成
                self.dataExport.show()
                self.visual.show()
                self.groupBox_9.show()
                self.label_5.setText(u"当前状态:求解完成")
                length = len(self.selected)
                if length == 1:
                    self.radioButton3.show()
                    self.radioButton2.hide()
                    self.radioButton1.hide()
                elif length == 2:
                    self.radioButton3.show()
                    self.radioButton2.show()
                    self.radioButton1.hide()
                elif length == 3:
                    self.radioButton3.show()
                    self.radioButton2.show()
                    self.radioButton1.show()
        except ValueError:
            QtGui.QMessageBox.warning(self, u"系统消息", u"输入有误或未输入,请重新输入")

    # 可视化作图
    @pyqtSignature("")
    def on_visual_clicked(self):
        """
        可视化仿真结果
        """
        if self.radioButton1.isChecked():

            self. plot3d()
        if self.radioButton2.isChecked():

            self.plot2d()

        if self.radioButton3.isChecked():

            self.plotTimeSeries()

    # 作图选项
    @pyqtSignature("")
    def on_radioButton1_clicked(self):
        self.comboBox1.hide()
        self.comboBox2.hide()

    @pyqtSignature("")
    def on_radioButton2_clicked(self):
        length = len(self.selected)
        self.comboBox2.hide()
        if 3 == length:
            self.comboBox1.show()
            self.comboBox1.clear()
            self.comboBox1.addItem(u"")
            self.comboBox1.setItemText(
                0, self.selected[0] + '-' + self.selected[1])
            self.comboBox1.addItem(u"")
            self.comboBox1.setItemText(
                1, self.selected[0] + '-' + self.selected[2])
            self.comboBox1.addItem(u"")
            self.comboBox1.setItemText(
                2, self.selected[1] + '-' + self.selected[2])

    @pyqtSignature("")
    def on_radioButton3_clicked(self):
        self.comboBox1.hide()

        length = len(self.selected)
        if length > 1:
            self.comboBox2.show()
            self.comboBox2.clear()
            for i in range(length):
                self.comboBox2.addItem(u"")
                self.comboBox2.setItemText(i, 't-' + self.selected[i])

    # 选择自定义配置文件
    @pyqtSignature("")
    def on_selectFile_triggered(self,  parent=None):
        """
        选择配置文件
        """
        filename = QtGui.QFileDialog.getOpenFileName(
            self, u"请选择配置文件", ".", "Config file(*.ini)")
        self.getDefaultConfig(str(filename))
        # 重新加载配置
        Ui_mainWindow.sysConfig(self)

    # 重载配置
    @pyqtSignature("")
    def on_reloadConfig_triggered(self):
        """
        重载配置
        """
        self.getDefaultConfig(self.defaultPath)

        Ui_mainWindow.sysConfig(self)

    # 退出系统
    @pyqtSignature("")
    def on_exitSystem_triggered(self):
        """
        退出仿真系统
        """
        self.close()

    # 关于
    @pyqtSignature("")
    def on_about_triggered(self):
        strs = "<br>" + self.projectName + " v" + self.version +\
            "<br><br>&copy;2017 Jianwen Xu<br><br>" +\
            "<a href='{0}'>{0}</a><br><br>".format(self.myGithub) +\
            "<a href='mailto:{0}'>{0}</a><br><br>".format(self.myEmail) +\
            "<a href='" + self.school_url + "'>" + self.school + "</a><br><br>"
        QtGui.QMessageBox.about(self, u"关于", strs)

    # 重新加载配置
    @pyqtSignature("")
    def on_reload_clicked(self):

        self.getDefaultConfig(self.defaultPath)

        Ui_mainWindow.sysConfig(self)

        self.reload.hide()

 #####以下为操作函数#########################
    # 获取配置文件信息
    def getDefaultConfig(self, path):
        """
        读取配置文件
        返回配置信息
        """
        if 0 != len(path):

            self.defaultConfig = config.read_ini(path)
            self.defaultPath = path

        else:
            pass

    # 获取当前仿真系统
    def getSystem(self, systemName):
        '''
        获取仿真系统
        得到当前仿真系统:self.fun
        '''
        self.selected = list(self.defaultConfig[systemName])
        length = len(self.selected)
        self.funstr = "\n"
        self.fun = []
        for i in range(length):
            self.fun.append(self.defaultConfig[systemName][self.selected[i]])
            self.funstr += "d" + \
                self.selected[
                    i] + "/dt=" + self.defaultConfig[systemName][self.selected[i]] + "\n\n"

    # 获取仿真参数
    def getParas(self):
        '''
        获取仿真参数
        '''
        # 获取仿真时间
        self.simuTime = []
        self.simuTime.append(float(self.lineEdit.text()))
        self.simuTime.append(float(self.lineEdit_2.text()))
        self.simuTime.append(float(self.lineEdit_3.text()))
        # 获取仿真初始值
        self.initValues = []
        length = len(self.selected)
        if 1 == length:
            self.initValues.append(float(self.lineEdit_4.text()))
        elif 2 == length:
            self.initValues.append(float(self.lineEdit_4.text()))
            self.initValues.append(float(self.lineEdit_5.text()))
        elif 3 == length:
            self.initValues.append(float(self.lineEdit_4.text()))
            self.initValues.append(float(self.lineEdit_5.text()))
            self.initValues.append(float(self.lineEdit_6.text()))

    # 仿真参数面板显示
    def showParaControl(self):
        '''
        参数面板控制 
        '''
        self.reload.hide()
        length = len(self.selected)
        if 1 == length:
            self.var1.setText(self.selected[0])
            self.lineEdit_4.show()
        elif 2 == length:
            self.var1.setText(self.selected[0])
            self.var1_2.setText(self.selected[1])
            self.lineEdit_4.show()
            self.lineEdit_5.show()
        elif 3 == length:
            self.var1.setText(self.selected[0])
            self.var1_2.setText(self.selected[1])
            self.var1_3.setText(self.selected[2])
            self.lineEdit_4.show()
            self.lineEdit_5.show()
            self.lineEdit_6.show()
        elif 0 == length:
            self.groupBox_2.hide()
            self.reload.show()
            QtGui.QMessageBox.information(
                self, u"系统消息", u"当前仿真系统未定义\n请修改配置文件后重新加载")
        else:
            self.groupBox_2.hide()
            self.reload.show()
            QtGui.QMessageBox.information(
                self, u"系统消息", u"当前系统支持到3维系统\n请修改配置文件后重新加载")

    # ode45求解仿真系统
    def odefuns(self, initValue, t):
        data = []
        lens = len(self.selected)
        for i in range(lens):
            funs = self.fun[i]
            for j in range(lens):
                funs = funs.replace(self.selected[j], str(initValue[j]))
            data.append(eval(funs))
        # print lens
        #scope = {}
        #data = []
        # for i in range(lens):
        #    scope[str(self.selected[i])] = initValue[i]
        # print scope
        # for i in range(lens):
        #    data.append(eval(self.fun[i], scope))
        return np.array(data)

    # 系统仿真函数
    def mySimulation(self):

        self.t = np.arange(self.simuTime[0], self.simuTime[
                           1], self.simuTime[2])  # 创建时间点
        self.data = odeint(self.odefuns, self.initValues, self.t)

    # 系统仿真结果可视化
    def plot2d(self):

        index = self.comboBox1.currentIndex()
        if 0 == index or len(self.selected) == 2:
            plt.plot(self.data[:, 0], self. data[:, 1])
            plt.xlabel(self.selected[0])
            plt.ylabel(self.selected[1])
        elif 1 == index:
            plt.plot(self.data[:, 0], self. data[:, 2])
            plt.xlabel(self.selected[0])
            plt.ylabel(self.selected[2])
        elif 2 == index:
            plt.plot(self.data[:, 1], self. data[:, 2])
            plt.xlabel(self.selected[1])
            plt.ylabel(self.selected[2])
        plt.show()

     # 系统仿真结果三维可视化
    def plot3d(self):

        fig = plt.figure(1)
        ax = Axes3D(fig)
        ax.plot(self.data[:, 0], self.data[:, 1], self. data[:, 2])
        ax.set_xlabel(self.selected[0])
        ax.set_ylabel(self.selected[1])
        ax.set_zlabel(self.selected[2])
        plt.show()

    def plotTimeSeries(self):
        length = len(self.selected)
        index = self.comboBox2.currentIndex()
        if length == 1 or 0 == index:
            plt.plot(self.t, self.data[:, 0])
            plt.xlabel('t')
            plt.ylabel(self.selected[0])
        else:
            plt.plot(self.t, self.data[:, index])
            plt.xlabel('t')
            plt.ylabel(self.selected[index])
        plt.show()
    # 导出数据

    def outPutData(self, size):

        for i in range(size[0]):
            strs = ''
            for j in range(size[1] - 1):
                strs = strs + str(self.data[i, j]) + ' '
            strs = strs + str(self.data[i, -1]) + '\n'
            self.outPut.write(strs)

if __name__ == "__main__":
    app = QtGui.QApplication(sys.argv)
    dlg = DynamicSystem()
    dlg.show()
    sys.exit(app.exec_())
