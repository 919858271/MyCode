# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['DEBUG'] = True
app.config['HOST'] = '127.0.0.1'
app.config['PORT'] = 5000
app.config[
    'SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:2015201893@localhost:3306/test'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(app)