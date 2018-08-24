#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def index():
    return 'Think Flask'


@app.route('/home/<username>')
def test_route(username):
    return render_template('index.html', username=username)


if __name__ == '__main__':
    app.debug = True
    app.run()