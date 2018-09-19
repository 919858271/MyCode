# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from main import app
from home.views.index import home_index
from admin.views.index import admin_index

URL = [{
    'url': home_index,
    'url_prefix': '/home/'
}, {
    'url': admin_index,
    'url_prefix': '/admin/'
}]

for url in URL:
    app.register_blueprint(url['url'], url_prefix=url['url_prefix'])