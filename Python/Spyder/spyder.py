#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from urllib import request
url = u'http://www.xicidaili.com/nn/'
headers = {
    'User-Agent': 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
    'Referer': url
}

req = request.Request(url, headers=headers)
res = request.urlopen(req)
html = res.read().decode('utf-8')
print(html)