# -*- coding: utf-8 -*-
from ctypes import *
import numpy as np
import matplotlib.pyplot as plt

loadDll = cdll.LoadLibrary 
dllFun = loadDll ("1.dll")
cInt = c_int * 2
cFloat = c_float * 4


a = cInt(2, 2)
b = cInt(3, 4)
c = cFloat()
dllFun.foo(a, b, c)

x = np.array(c)
x = x.reshape((2, 2))
print x

plt.plot(c, "*")
plt.show()



