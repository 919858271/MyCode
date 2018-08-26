#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
# net spyder study
#-------------------------------------------------------------------------------
from urllib import request, parse
from http import cookiejar


def test_print(contents):
    print(contents)


def set_cookies():
    cookie_file = 'cookie.txt'
    cookie = cookiejar.MozillaCookieJar(cookie_file)
    cookie_handler = request.HTTPCookieProcessor(cookie)
    return cookie_handler, cookie


def set_proxy(proxy=False):
    proxy_handler = False
    if proxy:
        proxy_handler = request.ProxyHandler(proxy)
    return proxy_handler


def set_headers(request_url=False,
                user_agent='Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'):
    headers = False
    if request_url:
        headers = {'User-Agent': user_agent, 'Referer': request_url}
    return headers


def set_request_datas(value=False):
    request_datas = False
    if value:
        request_datas = parse.urlencode(value).encode('utf-8')
    return request_datas


def config_request(request_url, request_data, method, proxy):

    requests = False
    cookie_handler = False
    proxy_handler = False
    headers = False
    request_datas = False
    opener = False

    if request_data and method:
        request_datas = set_request_datas(request_data)
    if proxy and len(proxy) > 0:
        proxy_handler = set_proxy(proxy)

    cookie_handler, cookie = set_cookies()
    headers = set_headers(request_url)
    if cookie_handler and proxy_handler:
        opener = request.build_opener(cookie_handler, proxy_handler)
        request.install_opener(opener)

    if not method:
        requests = request.Request(request_url, headers=headers)  #static
    elif method == 'POST':
        requests = request.Request(
            request_url, request_datas, headers=headers)  #post
    elif method == 'GET':
        get_request_url = request_url + '?' + request_datas
        requests = request.Request(get_request_url, headers=headers)  #get

    return requests, cookie


def get_url_contents(request_url=False,
                     method=False,
                     request_data=False,
                     proxy=False):
    if request_url:
        requests, cookie = config_request(request_url, request_data, method,
                                          proxy)
        if requests:
            response = request.urlopen(requests)
            cookie.save(ignore_discard=True, ignore_expires=True)
        test_print(response.read().decode('utf-8'))
        # for item in cookie:
        #     print('Name = ' + item.name)
        #     print('Value = ' + item.value)
        # return response.read()
    return False


values = {'username': 'cqc', 'password': 'XXXX'}
url = "https://passport.csdn.net/account/login?from=http://my.csdn.net/my/mycsdn"
proxys = {'http': '61.135.217.7:80'}
get_url_contents(url, 'POST', values, proxys)
