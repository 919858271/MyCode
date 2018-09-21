# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from app.setting import app
from home.views.index import home_index
from admin.views.index import admin_index

app.register_blueprint(home_index, url_prefix='/')
app.register_blueprint(admin_index, url_prefix='/admin/')
