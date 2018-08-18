#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
import pandas as pd
import numpy as np

file_path = 'test.csv'


def create_test_data():
    n = 10
    DataSet = np.random.rand(n, n)
    data_col = pd.date_range(start='4/1/2018', periods=n)
    df = pd.DataFrame(data=DataSet, columns=data_col, index=range(0, n))
    df.to_csv('test.csv')


def read_csv_data(file_path):
    df = pd.read_csv(file_path)
    columns = [
        '2018-04-02', '2018-04-03', '2018-04-04', '2018-04-05', '2018-04-06',
        '2018-04-07', '2018-04-08', '2018-04-09', '2018-04-10'
    ]
    #print(df.columns.tolist())
    #print(df.index.tolist())
    #print(df.values.tolist())
    print(df[columns].to_dict(orient='list'))


#create_test_data()
read_csv_data(file_path)