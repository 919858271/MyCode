#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------

from urllib import request
from bs4 import BeautifulSoup

ip_tag = 'tr'


def get_html(url):
    headers = {
        'User-Agent': 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
        'Referer': url
    }
    req = request.Request(url, headers=headers)
    res = request.urlopen(req)
    return res.read().decode('utf-8')


def get_ip_items(html):
    return BeautifulSoup(html, "html.parser").findAll(ip_tag)


def get_ip_type(ip):
    if 'HTTPS' in ip:
        return 'HTTPS'
    return 'HTTP'


def get_ips(ip_items):
    ips = []
    for ip in ip_items[1:]:
        ip = ip.text.split()
        ips.append({'ip_type': get_ip_type(ip), 'ip': ip[0], 'port': ip[1]})
    return ips


def ip_spyder(url):
    html = get_html(url)
    ip_items = get_ip_items(html)
    return get_ips(ip_items)