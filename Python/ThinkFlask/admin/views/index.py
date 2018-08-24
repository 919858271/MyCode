#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Blueprint, render_template

admin_index = Blueprint('admin_index', __name__)


@admin_index.route('/')
def index():
    return 'Think Flask. This is Admin'


@admin_index.route('/test/<username>/')
def test(username):
    return render_template('admin/index.html', username=username)
