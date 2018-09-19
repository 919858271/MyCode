#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import url_for, redirect
from common.setting import *
from home.model import models as home
from admin.model import models as admin
from common import urls


@app.route('/')
def index():
    index_url = url_for('home_index.index')
    return redirect(index_url)
