# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
import os
from flask_sqlalchemy import SQLAlchemy
from .mongodb import MongoDB

#ROOT
ROOT_PATH = os.path.abspath(os.path.dirname(__file__))
# upload
UPLOAD_PATH = ROOT_PATH.replace('\\', '/') + '/static/uploads'
ALLOWED_EXTENSIONS = set(['csv'])
#db
DB = SQLAlchemy()
MONGODB = MongoDB({'HOST': 'localhost', 'PORT': 27017})
# model
DEBUG = True
#mysql
HOST = '127.0.0.1'
PORT = 5000
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:2015201893@localhost:3306/test'
SQLALCHEMY_TRACK_MODIFICATIONS = True
#url config
BLUEPRINTS = [{'url': 'app.main:main', 'url_prefix': '/home'}]
#menu
LOG_TYPE = [{
    'key': 'autolog',
    'value': 'autolog'
}, {
    'key': 'firstlog',
    'value': u'一级log'
}]
