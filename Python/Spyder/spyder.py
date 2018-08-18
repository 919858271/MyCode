#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from urllib import request
from bs4 import BeautifulSoup

url = u'http://www.xicidaili.com/nn/'
headers = {
    'User-Agent': 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
    'Referer': url
}

req = request.Request(url, headers=headers)
res = request.urlopen(req)
html = res.read().decode('utf-8')
bs = BeautifulSoup(html, "html.parser")

ips = bs.findAll("tr")
for ip in ips:
    print(ip.text.split())