# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
import datetime


class Student(object):
    def __init__(self):
        self.__birth = None
        self.__age = None

    @property  #read
    def birth(self):
        return self.__birth

    @birth.setter  #write
    def birth(self, value):
        self.__birth = value

    @property
    def age(self):
        return datetime.datetime.now(
        ).year - self.__birth if self.__birth else self.__age


s = Student()
print(s.birth)
print(s.age)
s.birth = 1991
print(s.birth)
print(s.age)
