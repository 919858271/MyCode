#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import render_template
from admin import admin_router

@admin_router.route('/')
def index():
    return 'Think Flask. This is Admin'


@admin_router.route('/test/<username>/')
def test(username):
    return render_template('admin/index.html', username=username)
