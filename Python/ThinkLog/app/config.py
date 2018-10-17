# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
import os
ROOT_PATH = os.path.abspath(os.path.dirname(__file__))
UPLOAD_PATH = ROOT_PATH.replace('\\', '/') + '/static/uploads'

LOG_TYPE = [{
    'key': 'autolog',
    'value': 'autolog'
}, {
    'key': 'firstlog',
    'value': u'一级log'
}]


class DefaultConfig:
    DEBUG = True
    HOST = '127.0.0.1'
    PORT = 5000
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:2015201893@localhost:3306/test'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    ALLOWED_EXTENSIONS = set(['csv'])


class MongoDBConfig:
    DB_CONFIG = {'HOST': 'localhost', 'PORT': 27017}


class URLConfig:
    blueprints = [{'url': 'app.main:main', 'url_prefix': '/home'}]
