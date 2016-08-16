# -*- coding: utf-8 -*-
import numpy as np
import scipy as sp
import matplotlib.pyplot as plt
from scipy.integrate import odeint
from mpl_toolkits.mplot3d import Axes3D
import easygui as egui
import sys
import ctypes	
whnd = ctypes.windll.kernel32.GetConsoleWindow()
if whnd != 0:
    ctypes.windll.user32.ShowWindow(whnd, 0)
    ctypes.windll.kernel32.CloseHandle(whnd)	

def lorenz(w, t, p, r, b):  
    x, y, z = w
    return np.array([p*(y-x), x*(r-z)-y, x*y-b*z])

egui.msgbox("欢迎进入混沌系统演示平台")
msg="演示平台"

while 1:
    title   ="混沌系统演示平台"
    choices =["Lor","Ros","Chen"]
    choice  =egui.choicebox(msg, title, choices)
    if choice=="Lor":
        t = np.arange(0, 30, 0.01)

        track1 = odeint(lorenz, (0.0, 1.00, 0.0), t, args=(10.0, 28.0, 3.0))

        track2 = odeint(lorenz, (0.0, 1.01, 0.0), t, args=(10.0, 28.0, 3.0))

        np.savetxt("a.txt", track1)
        fig = plt.figure(1)
        ax  = Axes3D(fig)
        ax.plot(track1[:,0], track1[:,1], track1[:,2])
        ax.plot(track2[:,0], track2[:,1], track2[:,2])
        ax.grid(False)
        ax.set_ylabel('Y')
        ax.set_xlabel('X')
        ax.set_zlabel('Z')

        plt.figure(2)
        plt.plot(track2[:,0], track2[:,1],'r')
        plt.xlabel('$f(x)$')
        plt.ylabel('y')
        plt.figure(3)
        plt.plot(track2[:,0], track2[:,2])
        plt.xlabel('$f(x)$')
        plt.ylabel('y')
        plt.figure(4)
        plt.plot(track2[:,1], track2[:,2])
        plt.xlabel('$f(x)$')
        plt.ylabel('y')
        plt.show()

    else:
        sys.exit(0)

