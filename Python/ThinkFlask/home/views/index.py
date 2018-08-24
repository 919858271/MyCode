#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Blueprint, render_template

home_index = Blueprint('home_index', __name__)


@home_index.route('/')
def index():
    return 'Think Flask. This is Home'


@home_index.route('/test/<username>/')
def test(username):
    return render_template('home/index.html', username=username)
