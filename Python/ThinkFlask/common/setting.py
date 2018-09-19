# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from common import config

app = Flask(__name__)
app.config.from_object(config)
db = SQLAlchemy(app)