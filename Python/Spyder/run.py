#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from MongoDB import MongoDB
from config import DB_CONFIG
from spyder import ip_spyder
url = u'http://www.xicidaili.com/nn/'

MyDB = MongoDB(DB_CONFIG)
n = 3369
for i in range(1, n + 1):
    t_url = url + str(i)
    print('getting ' + t_url)
    ips = ip_spyder(t_url)
    MyDB.db['ip'].insert_many(ips)
