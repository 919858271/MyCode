#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Flask, url_for, redirect
from common.config import BaseConfig, URLConfig

app = Flask(__name__)
app.config.from_object(BaseConfig)

for url in URLConfig.URL:
    app.register_blueprint(url['url'], url_prefix=url['url_prefix'])


@app.route('/')
def index():
    index_url = url_for('home_index.index')
    return redirect(index_url)
