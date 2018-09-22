#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Blueprint, render_template
from app.models import Model
from home.model.models import User

home_index = Blueprint('home_index', __name__)


@home_index.route('/')
def index():
    return 'Think Flask. This is Home'


@home_index.route('/add/<username>/<password>/')
def add_user(username, password):
    user = User(username=username, password=password)
    Model.save(user)
    return 'success'


@home_index.route('/delete/<int:key>/')
def delete_user(key):
    user = User.query.get(key)
    Model.delete(user)
    return 'success'


@home_index.route('/test/<username>/')
def test(username):
    return render_template('home/index.html', username=username)
