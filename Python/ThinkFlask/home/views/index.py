#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import render_template
from app.models import Model
from home.model.models import User
from home import home_router


@home_router.route('/')
def index():
    return 'Think Flask. This is Home'


@home_router.route('/add/<username>/<password>/')
def add_user(username, password):
    user = User(username=username, password=password)
    User.insert(user)
    return 'success'


@home_router.route('/delete/<int:key>/')
def delete_user(key):
    user = User.query.get(key)
    Model.delete(user)
    return 'success'


@home_router.route('/test/<username>/')
def test(username):
    return render_template('home/index.html', username=username)
