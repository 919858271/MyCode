#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
#-------------------------------------------------------------------------------
import pandas as pd
import numpy as np

file_path = '1.csv'


class CSV():
    def __init__(self, csv_file_path):
        self.df = pd.read_csv(csv_file_path)

    def select(self, by_field=[]):
        return self.df[by_field] if by_field else False


data = CSV(file_path)
field = ['v1', 'v2']

v1 = data.select(field)
print(v1)
