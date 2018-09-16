# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from home.views.index import home_index
from admin.views.index import admin_index


class URLConfig(object):
    URL = [{
        'url': home_index,
        'url_prefix': '/home/'
    }, {
        'url': admin_index,
        'url_prefix': '/admin/'
    }]


class BaseConfig(object):
    DEBUG = True
    HOST = '127.0.0.1'
    PORT = 5000
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:2015201893@localhost:3306/test'
    SQLALCHEMY_TRACK_MODIFICATIONS = True